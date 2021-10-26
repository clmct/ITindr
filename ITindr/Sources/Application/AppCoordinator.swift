import UIKit

class AppCoordinator: CoordinatorProtocol {
  var navigationController: UINavigationController
  private var childCoordinators: [CoordinatorProtocol] = []
  private let appDependency = AppDependency()
  
  init() {
    navigationController = UINavigationController()
    setup()
  }
  
  func start() {
    let coordinator = MainTabBarCoordinator(appDependency: appDependency,
                                            navigationController: navigationController)
    childCoordinators.append(coordinator)
    coordinator.start()
    
  }
  
  private func setup() {
    navigationController.setNavigationBarHidden(true, animated: false)
  }
}
