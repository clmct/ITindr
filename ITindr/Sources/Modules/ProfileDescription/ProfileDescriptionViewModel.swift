import Foundation
import UIKit

protocol ProfileDescriptionViewModelDelegate: AnyObject {
  func profileDescriptionViewModelDidSave(_ viewModel: ProfileDescriptionViewModel)
  func profileDescriptionViewModelDidRequestShowImagePicker(_ viewModel: ProfileDescriptionViewModel)
}

protocol ProfileDescriptionViewModelProtocol {
  var onDidUpdatePhoto: ((UIImage) -> Void)? { get set }
  func save()
  func showImagePicker()
}

final class ProfileDescriptionViewModel: ProfileDescriptionViewModelProtocol {
  weak var delegate: ProfileDescriptionViewModelDelegate?
  var onDidUpdatePhoto: ((UIImage) -> Void)?
  
  func save() {
    delegate?.profileDescriptionViewModelDidSave(self)
  }
  
  func showImagePicker() {
    delegate?.profileDescriptionViewModelDidRequestShowImagePicker(self)
  }
  
  // Coordinator input
  func updateImage(image: UIImage) {
    onDidUpdatePhoto?(image)
  }
}
