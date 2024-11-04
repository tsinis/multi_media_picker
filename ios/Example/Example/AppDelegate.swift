//
//  AppDelegate.swift
//  Example
//
//  Created by tsinis on 04.11.2024.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    self.window = UIWindow(frame: UIScreen.main.bounds)

    let nav = UINavigationController(rootViewController: ViewController())
    self.window?.rootViewController = nav

    self.window?.makeKeyAndVisible()

    return true
  }

}
