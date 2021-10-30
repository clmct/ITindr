import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  let appCoordinator: AppCoordinator = AppCoordinator()
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow()
    window?.rootViewController = appCoordinator.navigationController
    window?.makeKeyAndVisible()
    appCoordinator.start()
    setup()
    return true
  }
  
  func setup() {
    UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    UINavigationBar.appearance().shadowImage = UIImage()
    UINavigationBar.appearance().isTranslucent = true
    UINavigationBar.appearance().backgroundColor = .clear
    UINavigationBar.appearance().barStyle = .black
    UINavigationBar.appearance().tintColor = UIColor.base1
    UINavigationBar.appearance().barTintColor = UIColor.base1
    UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.base1]
    UITabBar.appearance().unselectedItemTintColor = UIColor.base3
    UITabBar.appearance().tintColor = UIColor.base1
  }
}

