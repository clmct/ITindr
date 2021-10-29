import UIKit

protocol ChatFlowCoordinatorDelegate: AnyObject {
}

final class ChatFlowCoordinator: CoordinatorProtocol {
  // MARK: - Properties
  weak var delegate: ChatFlowCoordinatorDelegate?
  var navigationController: UINavigationController
  var tabBarNavigationController: UINavigationController
  private var childCoordinators: [CoordinatorProtocol] = []
  private let appDependency: AppDependency
  
  // MARK: - Init
  init(appDependency: AppDependency,
       tabBarNavigationController: UINavigationController,
       navigationController: UINavigationController) {
    self.appDependency = appDependency
    self.navigationController = navigationController
    self.tabBarNavigationController = tabBarNavigationController
  }
  
  // MARK: - Public Methods
  func start() {
    showChatList()
  }
  
  // MARK: - Private Methods
  private func showChatList() {
    let viewModel = ChatListViewModel(dependencies: appDependency)
    viewModel.delegate = self
    let viewController = ChatListViewController(viewModel: viewModel)
    navigationController.pushViewController(viewController, animated: true)
  }
  
  private func showChat(id: String) {
    let viewModel = ChatViewModel(id: id,
                                  dependencies: appDependency)
    viewModel.delegate = self
    let viewController = ChatViewController(viewModel: viewModel)
    tabBarNavigationController.pushViewController(viewController, animated: true)
  }
}
 
extension ChatFlowCoordinator: ChatListViewModelDelegate {
  func ChatListViewModelDidRequestShowChat(_ viewModel: ChatListViewModel, with id: String) {
    showChat(id: id)
  }
}

extension ChatFlowCoordinator: ChatViewModelDelegate {
  func viewWillAppear() {
    tabBarNavigationController.setNavigationBarHidden(false, animated: false)
  }
  
  func viewWillDisappear() {
    tabBarNavigationController.setNavigationBarHidden(true, animated: false)
  }
}
