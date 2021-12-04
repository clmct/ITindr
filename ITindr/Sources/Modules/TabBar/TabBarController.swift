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
    tabBarController.selectedIndex = 0
    navigationController.setViewControllers([tabBarController], animated: true)
  }
  
  // MARK: - Private Methods
  private func makeTabBarControllers() -> [UIViewController] {
    return [
      prepareUsersCoordinator(),
      preparePeopleCoordinator(),
      prepareChatFlowCoordinator(),
      prepareProfileCoordinator()
    ]
  }

  private func prepareUsersCoordinator() -> UIViewController {
    let tabBarItem = UITabBarItem(title: R.string.localizable.search(),
                                  image: R.image.tabBar0(),
                                  tag: 0)
    let navigationController = UINavigationController()
    navigationController.setNavigationBarHidden(true, animated: false)
    navigationController.navigationBar.barTintColor = .base1
    navigationController.tabBarItem = tabBarItem
    let coordinator = UsersCoordinator(appDependency: appDependency,
                                         navigationController: navigationController)
    childCoordinators.append(coordinator)
    coordinator.start()
    coordinator.delegate = self
    return navigationController
  }
  
  private func preparePeopleCoordinator() -> UIViewController {
    let tabBarItem = UITabBarItem(title: R.string.localizable.people(),
                                  image: R.image.tabBar1(),
                                  tag: 1)
    let navigationController = UINavigationController()
    navigationController.setNavigationBarHidden(false, animated: false)
    navigationController.tabBarItem = tabBarItem
    let viewModel = PeopleViewModel(dependencies: appDependency)
    viewModel.delegate = self
    let vc = PeopleViewController(viewModel: viewModel)
    vc.title = "Люди"
    vc.view.backgroundColor = .green
    navigationController.setViewControllers([vc], animated: false)
    return navigationController
  }
  
  private func prepareChatFlowCoordinator() -> UIViewController {
    let tabBarItem = UITabBarItem(title: R.string.localizable.chats(),
                                  image: R.image.tabBar2(),
                                  tag: 2)
    let navigationController = UINavigationController()
    navigationController.tabBarItem = tabBarItem
    navigationController.navigationBar.barTintColor = .base1
    let coordinator = ChatFlowCoordinator(appDependency: appDependency,
                                          tabBarNavigationController: self.navigationController,
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
    navigationController.tabBarItem = tabBarItem
    navigationController.navigationBar.barTintColor = .base1
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
extension MainTabBarCoordinator: ChatFlowCoordinatorDelegate {
  
}

// MARK: - UsersCoordinatorDelegate
extension MainTabBarCoordinator: UsersCoordinatorDelegate {
  
}

// MARK: - PeopleViewModelDelegate
extension MainTabBarCoordinator: PeopleViewModelDelegate {
  func peopleViewModelDidRequestShowAboutUser(_ viewModel: PeopleViewModel, id: String) {
    let viewModel = AboutUserViewModel(dependencies: appDependency, id: id)
    let vc = AboutUserViewController(viewModel: viewModel)
    navigationController.pushViewController(vc, animated: true)
  }
}

