import UIKit

protocol ChatListViewModelProtocol {
  var dataSource: ChartListTableViewDataSource<ChatListCell, ChatListTableViewCell> { get set }
  var onDidUpdate: VoidClosure? { get set }
  func showChat(index: Int)
  func getList()
  func saveChats()
}

protocol ChatListViewModelDelegate: AnyObject {
  func ChatListViewModelDidRequestShowChat(_ viewModel: ChatListViewModel, with id: String)
}

struct ChatListCell {
  var id: String?
  var image: String?
  var title: String
  var description: String
}

final class ChatListViewModel: ChatListViewModelProtocol {
  // MARK: - Types
  typealias Dependencies = HasNetworkService & HasCoreDataService
  
  // MARK: - Properties
  weak var delegate: ChatListViewModelDelegate?
  
  var dataSource: ChartListTableViewDataSource<ChatListCell, ChatListTableViewCell>
  var models: [ChatListCell] = []
  let dependencies: Dependencies
  var onDidUpdate: VoidClosure?
  
  // MARK: - Init
  init(dependencies: Dependencies) {
    dataSource = ChartListTableViewDataSource<ChatListCell,
                                              ChatListTableViewCell>(models: models,
                                                                     reuseIdentifier: ChatListTableViewCell.identifier) { model, cell in
                                                cell.configure(with: model)
                                              }
    self.dependencies = dependencies
  }
  
  // MARK: - Public Methods
  func showChat(index: Int) {
    delegate?.ChatListViewModelDidRequestShowChat(self, with: models[index].title) // id
  }
  
  func saveChats() {
    dependencies.networkService.getChatList { result in
      switch result {
      case .success(let list):
        self.models = list.map { chat in
          ChatListCell(image: chat.chat.avatar, title: chat.chat.title, description: chat.lastMessage?.text ?? "")
        }
        self.dependencies.coreDataService.saveChats(with: self.models)
        self.getList()
      default:
        break
      }
    }
  }
  
  func getList() {
    dependencies.coreDataService.getChats { result in
      switch result {
      case .success(let chats):
        self.models = chats
        self.updateDataSource()
        self.onDidUpdate?()
      default:
        break
      }
    }
  }
  
  // MARK: - Private Methods
  
  private func updateDataSource() {
    dataSource = ChartListTableViewDataSource<ChatListCell,
                                              ChatListTableViewCell>(models: models,
                                                                     reuseIdentifier: ChatListTableViewCell.identifier) { model, cell in
                                                cell.configure(with: model)
                                              }
  }
}
