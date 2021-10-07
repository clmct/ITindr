import UIKit

protocol SignupViewModelProtocol {
}

protocol SignupViewModelDelegate: AnyObject {
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
  
  // MARK: - Actions
  
  // MARK: - Private Methods
}
