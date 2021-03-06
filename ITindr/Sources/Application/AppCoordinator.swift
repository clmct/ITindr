import UIKit

class AppCoordinator: CoordinatorProtocol {
  var navigationController: UINavigationController
  private var childCoordinators: [CoordinatorProtocol] = []
  
  init() {
    navigationController = UINavigationController()
  }
  
  func start() {
    navigationController.setNavigationBarHidden(true, animated: false)
    navigationController.pushViewController(ProfileDescriptionViewController(), animated: true)
//    let authCoordinator = AuthCoordinator(navigationController: navigationController)
//    childCoordinators.append(authCoordinator)
//    authCoordinator.start()
  }
}
