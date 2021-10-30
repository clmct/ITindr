import UIKit

protocol ChatCoordinatorDelegate: AnyObject {
}

final class ChatCoordinator: CoordinatorProtocol {
  // MARK: - Properties
  weak var delegate: ChatCoordinatorDelegate?
  var navigationController: UINavigationController
  private var childCoordinators: [CoordinatorProtocol] = []
  private let appDependency: AppDependency
  
  // MARK: - Init
  init(appDependency: AppDependency,
       navigationController: UINavigationController) {
    self.appDependency = appDependency
    self.navigationController = navigationController
  }
  
  // MARK: - Public Methods
  func start() {
  }
  
  // MARK: - Private Methods
}
