import UIKit

protocol SignupViewModelDelegate: AnyObject {
  func signupViewModelDidSignUp(_ viewModel: SignupViewModel)
  func signupViewModelDidBack(_ viewModel: SignupViewModel)
}

protocol SignupViewModelProtocol {
  var onDidError: VoidClosure? { get set }
  func signup(email: String, password: String)
  func back()
}

final class SignupViewModel: SignupViewModelProtocol {
  // MARK: - Types
  typealias Dependencies = HasNetworkService
  
  // MARK: - Properties
  weak var delegate: SignupViewModelDelegate?
  var onDidError: VoidClosure?
  private let dependencies: Dependencies
  
  // MARK: - Init
  init(dependencies: Dependencies) {
    self.dependencies = dependencies
  }
  
  // MARK: - Public Methods
  func signup(email: String, password: String) {
    dependencies.networkService.register(email: email,
                                         password: password) { result in
      switch result {
      case .success(let response):
        TOKEN = response.accessToken
        REFRESHTOKEN = response.refreshToken
        self.delegate?.signupViewModelDidSignUp(self)
      case .failure(let error):
        print(error)
        self.onDidError?()
      }
    }
  }
  
  func back() {
    delegate?.signupViewModelDidBack(self)
  }
  
  // MARK: - Actions
  
  // MARK: - Private Methods
}
