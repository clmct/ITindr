import UIKit

protocol ImagePickerCoordinatorDelegate: AnyObject {
  func imagePickerCoordinator(_ coordinator: ImagePickerCoordinator, didSelectImage: UIImage?)
}

final class ImagePickerCoordinator: NSCoder, CoordinatorProtocol {
  // MARK: - Properties
  
  weak var delegate: ImagePickerCoordinatorDelegate?
  var navigationController: UINavigationController
  private let sourceType: UIImagePickerController.SourceType
  private var image: UIImage?
  
  // MARK: - Init
  
  init(sourceType: UIImagePickerController.SourceType,
       navigationController: UINavigationController) {
    self.sourceType = sourceType
    self.navigationController = navigationController
  }
  
  // MARK: - Public Methods
  
  func start() {
    let imagePicker = UIImagePickerController()
    imagePicker.sourceType = sourceType
    imagePicker.delegate = self
    imagePicker.allowsEditing = true
    navigationController.present(imagePicker, animated: true, completion: nil)
  }
  
}

// MARK: - UIImagePickerControllerDelegate & UINavigationControllerDelegate

extension ImagePickerCoordinator: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController,
                             didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
    guard let image = info[.editedImage] as? UIImage else { return }
    self.delegate?.imagePickerCoordinator(self, didSelectImage: image)
    picker.dismiss(animated: true, completion: nil)
  }
}
