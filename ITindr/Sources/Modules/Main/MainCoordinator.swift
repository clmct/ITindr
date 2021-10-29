import UIKit

enum FlowStepType {
  case auth
  case main
}

final class MainCoordinator: CoordinatorProtocol {
  // MARK: - Properties
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
    startAuthCoordinator()
  }

  func showScreen(with type: FlowStepType) {
    switch type {
    case .auth:
      startAuthCoordinator()
    case .main:
      startMainCoordinator()
    }
  }
  
  // MARK: - Private Methods
  private func startAuthCoordinator() {
    let coordinator = AuthCoordinator(appDependency: appDependency,
                                      navigationController: navigationController)
    coordinator.delegate = self
    childCoordinators.append(coordinator)
    coordinator.start()
  }
  
  private func startMainCoordinator() {
    let coordinator = MainTabBarCoordinator(appDependency: appDependency,
                                            navigationController: navigationController)
    childCoordinators.append(coordinator)
    coordinator.start()
  }
}

extension MainCoordinator: AuthCoordinatorDelegate {
  func authCoordinatorDelegateDidFinish(_ coordinator: AuthCoordinator) {
    startMainCoordinator()
  }
}
