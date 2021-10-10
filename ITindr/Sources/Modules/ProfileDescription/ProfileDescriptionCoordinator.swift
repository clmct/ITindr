import UIKit

final class ProfileDescriptionCoordinator: CoordinatorProtocol {
  var navigationController: UINavigationController
  private var childCoordinators: [CoordinatorProtocol] = []
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let viewModel = ProfileDescriptionViewModel()
    viewModel.delegate = self
    let viewController = ProfileDescriptionViewController(viewModel: viewModel)
    navigationController.pushViewController(viewController, animated: true)
  }
}

extension ProfileDescriptionCoordinator: ProfileDescriptionViewModelDelegate {
  func profileDescriptionViewModelDidSave(_ viewModel: ProfileDescriptionViewModel) {
  }
}
  
