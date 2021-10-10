import Foundation

protocol ProfileDescriptionViewModelDelegate: AnyObject {
  func profileDescriptionViewModelDidSave(_ viewModel: ProfileDescriptionViewModel)
}

protocol ProfileDescriptionViewModelProtocol {
  func save()
}

final class ProfileDescriptionViewModel: ProfileDescriptionViewModelProtocol {
  weak var delegate: ProfileDescriptionViewModelDelegate?
  
  func save() {
    delegate?.profileDescriptionViewModelDidSave(self)
  }
  
}
