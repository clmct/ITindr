import UIKit

protocol SignupViewModelDelegate: AnyObject {
  func signupViewModelDidClose(_ viewModel: SignupViewModel)
}

protocol SignupViewModelProtocol {
  func signup()
}

final class SignupViewModel: SignupViewModelProtocol {
  // MARK: - Types
//  typealias Dependencies = Any
  
  // MARK: - Properties
  weak var delegate: SignupViewModelDelegate?
  
  // MARK: - Init
//  init(dependencies: Dependencies) {
//  }
  
  // MARK: - Public Methods
  func signup() {
    delegate?.signupViewModelDidClose(self)
  }
  
  // MARK: - Actions
  
  // MARK: - Private Methods
}
