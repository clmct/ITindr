import UIKit

protocol AuthCoordinatorDelegate: AnyObject {
  func authCoordinatorDelegateDidFinish(_ coordinator: AuthCoordinator)
}

final class AuthCoordinator: CoordinatorProtocol {
  weak var delegate: AuthCoordinatorDelegate?
  
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
    let viewModel = SignupViewModel(dependencies: appDependency)
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
    coordinator.delegate = self
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
  func signupViewModelDidSignUp(_ viewModel: SignupViewModel) {
    showProfileDescription()
  }
  
  func signupViewModelDidBack(_ viewModel: SignupViewModel) {
    navigationController.popViewController(animated: true)
  }
}


extension AuthCoordinator: LoginViewModelDelegate {
  func loginViewModelDidClose(_ viewModel: LoginViewModel) {
    showProfileDescription()
  }
}

extension AuthCoordinator: ProfileDescriptionCoordinatorDelegate {
  func profileDescriptionCoordinatorDidFinish(_ viewModel: ProfileDescriptionCoordinator) {
    delegate?.authCoordinatorDelegateDidFinish(self)
  }
}
