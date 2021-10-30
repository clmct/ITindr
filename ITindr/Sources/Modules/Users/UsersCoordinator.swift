import UIKit

protocol UsersCoordinatorDelegate: AnyObject {
}

final class UsersCoordinator: CoordinatorProtocol {
  // MARK: - Properties
  weak var delegate: UsersCoordinatorDelegate?
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
    let viewModel = UsersViewModel(dependencies: appDependency)
    let viewController = UsersViewController(viewModel: viewModel)
    navigationController.pushViewController(viewController, animated: true)
  }
  
  // MARK: - Private Methods
}
