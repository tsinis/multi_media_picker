import UIKit

/// This extension provides a method to find the nearest view controller
/// in the view hierarchy.
///
/// It handles the following cases:
/// - The view controller is presenting another view controller.
/// - The view controller is a UINavigationController.
/// - The view controller is a UITabBarController.
///
/// - Returns: The nearest view controller in the hierarchy.
extension UIViewController {
  var nearestViewController: UIViewController {
    if let navController = self as? UINavigationController {
      return navController.viewControllers.last?.nearestViewController
        ?? navController.visibleViewController ?? navController
    }

    if let tabController = self as? UITabBarController {
      return tabController.selectedViewController?.nearestViewController ?? tabController
    }

    if let presentedVC = presentedViewController {
      return presentedVC.nearestViewController
    }

    return self
  }
}
