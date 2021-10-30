import Foundation

protocol LoginViewModelDelegate: AnyObject {
  func loginViewModelDidClose(_ viewModel: LoginViewModel)
}

final class LoginViewModel {
  // MARK: - Types
  typealias Dependencies = HasNetworkService
  
  // MARK: - Properties
  weak var delegate: LoginViewModelDelegate?
  var onDidError: VoidClosure?
  private let dependencies: Dependencies
  
  // MARK: - Init
  init(dependencies: Dependencies) {
    self.dependencies = dependencies
  }
  
  // MARK: - Public Methods
  func login(email: String, password: String) {
    dependencies.networkService.login(email: email,
                                         password: password) { result in
      switch result {
      case .success(let response):
        TOKEN = response.accessToken
        REFRESHTOKEN = response.refreshToken
        self.delegate?.loginViewModelDidClose(self)
      case .failure(let error):
        print(error)
        self.onDidError?()
      }
    }
    
  }
}
