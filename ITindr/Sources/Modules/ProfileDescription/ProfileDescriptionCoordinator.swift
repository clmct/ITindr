import UIKit

protocol ProfileDescriptionCoordinatorDelegate: AnyObject {
  func profileDescriptionCoordinatorDidFinish(_ viewModel: ProfileDescriptionCoordinator)
}

final class ProfileDescriptionCoordinator: CoordinatorProtocol {
  weak var delegate: ProfileDescriptionCoordinatorDelegate?
  
  var navigationController: UINavigationController
  private var childCoordinators: [CoordinatorProtocol] = []
  private var imagePickerCoordinator: ImagePickerCoordinator?
  weak var profileDescriptionViewModel: ProfileDescriptionViewModel?
  var dependencies: AppDependency
  
  init(dependencies: AppDependency,
       navigationController: UINavigationController) {
    self.dependencies = dependencies
    self.navigationController = navigationController
  }
  
  func start() {
    let viewModel = ProfileDescriptionViewModel(dependencies: dependencies)
    profileDescriptionViewModel = viewModel
    viewModel.delegate = self
    let viewController = ProfileDescriptionViewController(viewModel: viewModel)
    navigationController.pushViewController(viewController, animated: true)
  }
}

extension ProfileDescriptionCoordinator: ProfileDescriptionViewModelDelegate {
  func profileDescriptionViewModelDidRequestShowImagePicker(_ viewModel: ProfileDescriptionViewModel) {
    navigationController.showImagePickerAlert { [weak self] state in
      guard let self = self else { return }
      switch state {
      case .camera:
        self.imagePickerCoordinator = self.showImagePicker(sourceType: .camera,
                                                           navigationController: self.navigationController,
                                                           delegate: self)
      case .library:
        self.imagePickerCoordinator = self.showImagePicker(sourceType: .photoLibrary,
                                                           navigationController: self.navigationController,
                                                           delegate: self)
      case .alertSimulator, .cancel:
        break
      }
    }
  }
  
  func profileDescriptionViewModelDidSave(_ viewModel: ProfileDescriptionViewModel) {
    delegate?.profileDescriptionCoordinatorDidFinish(self)
  }
}
  
// MARK: - ImagePickerCoordinatorDelegate

extension ProfileDescriptionCoordinator: ImagePickerCoordinatorDelegate {
  func imagePickerCoordinator(_ coordinator: ImagePickerCoordinator, didSelectImage: UIImage?) {
    guard let image = didSelectImage else { return }
    profileDescriptionViewModel?.updateImage(image: image)
  }
}

// MARK: - ImagePickerPresentingProtocol

extension ProfileDescriptionCoordinator: ImagePickerPresentingProtocol { }
