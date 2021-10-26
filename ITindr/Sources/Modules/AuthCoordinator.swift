import UIKit

final class AuthCoordinator: CoordinatorProtocol {
  var navigationController: UINavigationController
  private var childCoordinators: [CoordinatorProtocol] = []
  private let appDependency: AppDependency
  
  // MARK: - Init
  init(appDependency: AppDependency,
       navigationController: UINavigationController) {
    self.appDependency = appDependency
    self.navigationController = navigationController
  }
  
  func start() {
    navigationController.setNavigationBarHidden(true, animated: false)
    
    let viewModel = WelcomeViewModel()
    viewModel.delegate = self
    let viewController = WelcomeViewController(viewModel: viewModel)
    navigationController.setViewControllers([viewController], animated: true)
  }
  
  private func showSignup() {
    let viewModel = SignupViewModel()
    viewModel.delegate = self
    let viewController = SignupViewController(viewModel: viewModel)
    navigationController.pushViewController(viewController, animated: true)
  }
  
  private func showLogin() {
    let viewModel = LoginViewModel()
    viewModel.delegate = self
    let viewController = LoginViewController(viewModel: viewModel)
    navigationController.pushViewController(viewController, animated: true)
  }
  
  private func showProfileDescription() {
    let coordinator = ProfileDescriptionCoordinator(navigationController: navigationController)
    childCoordinators.append(coordinator)
    coordinator.start()
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

extension AuthCoordinator: SignupViewModelDelegate {
  func signupViewModelDidClose(_ viewModel: SignupViewModel) {
    showProfileDescription()
  }
}


extension AuthCoordinator: LoginViewModelDelegate {
  func loginViewModelDidClose(_ viewModel: LoginViewModel) {
    showProfileDescription()
  }
}
