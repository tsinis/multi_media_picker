import Foundation

/// Video file operations without Flutter types, so they can be unit tested on their own.
internal enum VideoFile {
  /// Moves (new recording) or copies (gallery video) the video at [url] into [directory].
  ///
  /// Throws a `video_copy_error` `PigeonError` whose details tell why the copy failed: does the
  /// source exist, does the target directory exist, free space and the file system errors.
  static func copy(
    _ url: URL,
    to directory: String,
    filename: String?,
    isNew: Bool,
    fileManager: FileManager = .default
  ) throws -> String {
    let fileExtension = url.pathExtension.lowercased()
    let targetFilename = (filename ?? "media_\(UUID().uuidString)") + ".\(fileExtension)"
    let targetURL = URL(fileURLWithPath: directory).appendingPathComponent(targetFilename)

    // Create a unique temporary target to avoid race conditions during override scenarios.
    let tempTargetURL = URL(fileURLWithPath: directory)
      .appendingPathComponent("temp_\(UUID().uuidString)_\(targetFilename)")
    var moveError: Error?
    var step = isNew ? "Move" : "Copy"  // The step that failed, in the error details.

    do {
      // First, perform operation to temporary location to avoid conflicts.
      if isNew {
        // Try move first for performance with newly recorded files.
        do {
          try fileManager.moveItem(at: url, to: tempTargetURL)
        } catch {
          moveError = error  // Fallback to copy if move fails.
          step = "Copy"
          try fileManager.copyItem(at: url, to: tempTargetURL)
        }
      } else {
        // For existing files, always copy to preserve original.
        try fileManager.copyItem(at: url, to: tempTargetURL)
      }

      // Now atomically move to final target, removing any existing file.
      step = "Replace"
      if fileManager.fileExists(atPath: targetURL.path) {
        try fileManager.removeItem(at: targetURL)
      }
      try fileManager.moveItem(at: tempTargetURL, to: targetURL)

      return targetURL.path
    } catch {
      // Collect the facts before the cleanup below changes them.
      var details = describe(url, directory: directory, fileManager: fileManager)
      if let moveError { details += " Move: \(moveError.codes)." }
      details += " \(step): \(error.codes)."

      // Cleanup temp file on failure.
      if fileManager.fileExists(atPath: tempTargetURL.path) {
        try? fileManager.removeItem(at: tempTargetURL)
      }

      throw PigeonError(
        code: "video_copy_error",
        message: "Failed to copy video file to target directory",
        details: details
      )
    }
  }

  private static func describe(
    _ source: URL,
    directory: String,
    fileManager: FileManager
  ) -> String {
    let attributes = try? fileManager.attributesOfItem(atPath: source.path)
    let sourceState = attributes.map { "exists: true, \(($0[.size] as? Int64) ?? -1) B" }
    let directoryURL = URL(fileURLWithPath: directory)
    var isDirectory: ObjCBool = false
    let hasDirectory =
      fileManager.fileExists(atPath: directory, isDirectory: &isDirectory) && isDirectory.boolValue
    // Source and target share the app container's volume, so tmp shows its free space too.
    let volume = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
    let freeBytes = (try? volume.resourceValues(forKeys: [.volumeAvailableCapacityKey]))?
      .volumeAvailableCapacity
    // swiftlint:disable:next no_magic_numbers
    let freeSpace = freeBytes.map { "\($0 / 1_000_000) MB" } ?? "unknown"

    return "Source: \(source.path) (\(sourceState ?? "exists: false")), "
      + "target directory: \(directoryURL.path) (exists: \(hasDirectory)), "
      + "free space: \(freeSpace)."
  }
}

extension Error {
  /// The text sent to Dart as `PlatformException.details` (and from there to Sentry).
  ///
  /// Do not use `localizedDescription` for a `PigeonError`: its own `localizedDescription` is not
  /// an `Error` requirement, so a caught `any Error` gives only "… PigeonError error 1.".
  var diagnosticDetails: String {
    guard let pigeonError = self as? PigeonError else {
      return "\(codes): \(localizedDescription)"
    }
    let message = pigeonError.message.map { ": \($0)." } ?? "."
    let details = pigeonError.details.map { " \($0)" } ?? ""

    return pigeonError.code + message + details
  }

  /// Domain and code, with the underlying error's ones, for example
  /// `NSCocoaErrorDomain 4 (NSPOSIXErrorDomain 2)`.
  var codes: String {
    let error = self as NSError
    let text = "\(error.domain) \(error.code)"
    guard let underlying = error.userInfo[NSUnderlyingErrorKey] as? NSError else { return text }

    return text + " (\(underlying.domain) \(underlying.code))"
  }
}
