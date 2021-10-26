import UIKit

protocol ChatListCoordinatorDelegate: AnyObject {
}

final class ChatListCoordinator: CoordinatorProtocol {
  // MARK: - Properties
  weak var delegate: ChatListCoordinatorDelegate?
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
    let viewModel = ChatListViewModel(dependencies: appDependency)
    let viewController = ChatListViewController(viewModel: viewModel)
    navigationController.pushViewController(viewController, animated: true)
  }
  
  // MARK: - Private Methods
}
