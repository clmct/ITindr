import UIKit

protocol ProfileViewModelProtocol {
  func showEdit()
}

protocol ProfileViewModelDelegate: AnyObject {
  func profileViewModelDidRequestShowEdit(_ viewModel: ProfileViewModel)
}

final class ProfileViewModel: ProfileViewModelProtocol {
  // MARK: - Types
  typealias Dependencies = Any
  
  // MARK: - Properties
  weak var delegate: ProfileViewModelDelegate?
  
  // MARK: - Init
  init(dependencies: Dependencies) {
  }
  
  // MARK: - Public Methods
  func showEdit() {
    delegate?.profileViewModelDidRequestShowEdit(self)
  }
  // MARK: - Actions
  
  // MARK: - Private Methods
}
