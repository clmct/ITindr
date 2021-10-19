import UIKit

class AppCoordinator: CoordinatorProtocol {
  var navigationController: UINavigationController
  private var childCoordinators: [CoordinatorProtocol] = []
  
  init() {
    navigationController = UINavigationController()
  }
  
  func start() {
    let viewController = ChatListViewController(viewModel: ChatListViewModel(dependencies: AppDependency()))
//    let viewController = ChatViewController(viewModel: ChatViewModel(dependencies: AppDependency()))
    navigationController.setNavigationBarHidden(true, animated: false)
    navigationController.pushViewController(ProfileViewController(viewModel: ProfileViewModel(dependencies: AppDependency())), animated: true)
//    let authCoordinator = AuthCoordinator(navigationController: navigationController)
//    childCoordinators.append(authCoordinator)
//    authCoordinator.start()
  }
}
