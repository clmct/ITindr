import UIKit

final class AuthCoordinator: CoordinatorProtocol {
  var navigationController: UINavigationController
  private var childCoordinators: [CoordinatorProtocol] = []
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    navigationController.setNavigationBarHidden(true, animated: false)
    
    let viewModel = WelcomeViewModel()
    viewModel.delegate = self
    let viewController = WelcomeViewController(viewModel: viewModel)
    navigationController.pushViewController(viewController, animated: true)
  }
  
  private func showSignup() {
    let viewModel = SignupViewModel()
    let viewController = SignupViewController(viewModel: viewModel)
    navigationController.pushViewController(viewController, animated: true)
  }
  
  private func showLogin() {
    let viewModel = LoginViewModel()
    let viewController = LoginViewController(viewModel: viewModel)
    navigationController.pushViewController(viewController, animated: true)
  }
}

extension AuthCoordinator: WelcomeViewModelDelegate {
  func welcomeViewModelDidRequestToShowSignup(_ viewModel: WelcomeViewModel) {
    showSignup()
  }
  
  func welcomeViewModelDidRequestToShowLogin(_ viewModel: WelcomeViewModel) {
    showLogin()
  }
}
