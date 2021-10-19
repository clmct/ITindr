import Foundation

protocol LoginViewModelDelegate: AnyObject {
  func loginViewModelDidClose(_ viewModel: LoginViewModel)
}

protocol LoginViewModelProtocol {
  func login()
}

final class LoginViewModel: LoginViewModelProtocol {
  weak var delegate: LoginViewModelDelegate?
  
  
  func login() {
    delegate?.loginViewModelDidClose(self)
  }
}
