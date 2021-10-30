import UIKit

protocol ProfileCoordinatorDelegate: AnyObject {
}

final class ProfileCoordinator: CoordinatorProtocol {
  // MARK: - Properties
  weak var delegate: ProfileCoordinatorDelegate?
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
    let viewModel = ProfileViewModel(dependencies: appDependency)
    viewModel.delegate = self
    let viewController = ProfileViewController(viewModel: viewModel)
    navigationController.pushViewController(viewController, animated: true)
  }
  
  // MARK: - Private Methods
  private func showEdit() {
    let coordinator = ProfileDescriptionCoordinator(dependencies: appDependency,
                                                    navigationController: navigationController)
    childCoordinators.append(coordinator)
    coordinator.start()
  }
}

extension ProfileCoordinator: ProfileViewModelDelegate {
  func profileViewModelDidRequestShowEdit(_ viewModel: ProfileViewModel) {
    showEdit()
  }
}
