import UIKit

extension UIColor {
  public convenience init(rgbValue: Int64) {
    let red: CGFloat = CGFloat((rgbValue & 0xFF0000) >> 16) / 0xFF
    let green: CGFloat = CGFloat((rgbValue & 0x00FF00) >> 8) / 0xFF
    let blue: CGFloat = CGFloat(rgbValue & 0x0000FF) / 0xFF
    let alpha = CGFloat((rgbValue & 0xFF00_0000) >> 24) / 0xFF

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}
