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
//    NetworkService.shared.login(email: "testemail@yandex.ru",
//                                password: "testpassword") { result in
//      if case let .success(data) = result {
//        print(data)
//      }
//      
//    }
    return true
  }
}

