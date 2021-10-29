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
      preparePeopleCoordinator(),
      prepareChatListCoordinator(),
      prepareProfileCoordinator()
    ]
  }
  
  private func preparePeopleCoordinator() -> UIViewController {
    let tabBarItem = UITabBarItem(title: R.string.localizable.people(),
                                  image: R.image.tabBar1(),
                                  tag: 1)
    let navigationController = UINavigationController()
    navigationController.setNavigationBarHidden(true, animated: false)
    navigationController.tabBarItem = tabBarItem
    let vc = UIViewController()
    vc.view.backgroundColor = .white
    navigationController.setViewControllers([vc], animated: false)
    return navigationController
  }
  
  private func prepareChatListCoordinator() -> UIViewController {
    let tabBarItem = UITabBarItem(title: R.string.localizable.chats(),
                                  image: R.image.tabBar2(),
                                  tag: 2)
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
    let tabBarItem = UITabBarItem(title: R.string.localizable.profile(),
                                  image: R.image.tabBar3(),
                                  tag: 3)
    let navigationController = UINavigationController()
    navigationController.setNavigationBarHidden(true, animated: false)
    navigationController.tabBarItem = tabBarItem
    let coordinator = ProfileCoordinator(appDependency: appDependency,
                                         navigationController: navigationController)
    childCoordinators.append(coordinator)
    coordinator.start()
    coordinator.delegate = self
    return navigationController
  }
  
  private func prepareSearchCoordinator() -> UIViewController {
    let tabBarItem = UITabBarItem(title: R.string.localizable.search(),
                                  image: R.image.tabBar0(),
                                  tag: 0)
    let navigationController = UINavigationController()
    navigationController.setNavigationBarHidden(true, animated: false)
    navigationController.tabBarItem = tabBarItem
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
