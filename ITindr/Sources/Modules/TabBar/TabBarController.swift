import UIKit

protocol MainTabBarCoordinatorDelegate: AnyObject {
}

final class MainTabBarCoordinator: CoordinatorProtocol {
  // MARK: - Properties
  weak var delegate: MainTabBarCoordinatorDelegate?
  var navigationController: UINavigationController
  private var childCoordinators: [CoordinatorProtocol] = []
  private let appDependency: AppDependency
  
  // MARK: - Init
  init(appDependency: AppDependency,
       navigationController: UINavigationController) {
    self.appDependency = appDependency
    self.navigationController = navigationController
  }
  
  // MARK: - Public Methods
  func start() {
    let tabBarController = UITabBarController()
    tabBarController.viewControllers = makeTabBarControllers()
    tabBarController.selectedIndex = 2
    navigationController.setViewControllers([tabBarController], animated: true)
  }
  
  // MARK: - Private Methods
  private func makeTabBarControllers() -> [UIViewController] {
    let vc =  UIViewController()
    vc.view.backgroundColor = .green
    return [
      prepareSearchCoordinator(),
      vc,
      prepareChatListCoordinator(),
      prepareProfileCoordinator()
    ]
  }
  
  private func prepareChatListCoordinator() -> UIViewController {
    let tabBarItem = UITabBarItem(title: "Chats", image: UIImage(named: "tabBar-2"), selectedImage: UIImage(named: "tabBar-2")?.imageWithColor(.red))
    let navigationController = UINavigationController()
    navigationController.setNavigationBarHidden(true, animated: false)
    navigationController.tabBarItem = tabBarItem
    let coordinator = ChatListCoordinator(appDependency: appDependency,
                                          navigationController: navigationController)
    childCoordinators.append(coordinator)
    coordinator.start()
    coordinator.delegate = self
    return navigationController
  }
  
  private func prepareProfileCoordinator() -> UIViewController {
    let navigationController = UINavigationController()
    navigationController.setNavigationBarHidden(true, animated: false)
    let coordinator = ProfileCoordinator(appDependency: appDependency,
                                         navigationController: navigationController)
    childCoordinators.append(coordinator)
    coordinator.start()
    coordinator.delegate = self
    return navigationController
  }
  
  private func prepareSearchCoordinator() -> UIViewController {
    let navigationController = UINavigationController()
    navigationController.setNavigationBarHidden(true, animated: false)
    let coordinator = ProfileCoordinator(appDependency: appDependency,
                                         navigationController: navigationController)
    childCoordinators.append(coordinator)
    coordinator.start()
    coordinator.delegate = self
    return navigationController
  }
}

// MARK: - ProfileCoordinatorDelegate
extension MainTabBarCoordinator: ProfileCoordinatorDelegate {
  
}

// MARK: - ChatListCoordinatorDelegate
extension MainTabBarCoordinator: ChatListCoordinatorDelegate {
  
}
