import Foundation

protocol WelcomeViewModelDelegate: AnyObject {
  func welcomeViewModelDidRequestToShowSignup(_ viewModel: WelcomeViewModel)
  func welcomeViewModelDidRequestToShowLogin(_ viewModel: WelcomeViewModel)
}

protocol WelcomeViewModelProtocol {
  func showSignup()
  func showLogin()
}

final class WelcomeViewModel: WelcomeViewModelProtocol {
  weak var delegate: WelcomeViewModelDelegate?
  
  func showSignup() {
    delegate?.welcomeViewModelDidRequestToShowSignup(self)
  }
  
  func showLogin() {
    delegate?.welcomeViewModelDidRequestToShowLogin(self)
  }
  
}
