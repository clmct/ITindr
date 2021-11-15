import UIKit

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
    if TOKEN == nil {
      startAuthCoordinator()
    } else {
      updateToken()
    }
  }
  
  func updateToken() {
    appDependency.networkService.refresh { result in
      switch result {
      case .success(let response):
        TOKEN = response.accessToken
        REFRESHTOKEN = response.refreshToken
        self.startMainCoordinator()
      case .failure(let error):
        print(error)
        self.startAuthCoordinator()
      }
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
