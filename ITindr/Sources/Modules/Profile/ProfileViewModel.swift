import UIKit

protocol ProfileViewModelProtocol {
}

protocol ProfileViewModelDelegate: AnyObject {
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
  
  // MARK: - Actions
  
  // MARK: - Private Methods
}
