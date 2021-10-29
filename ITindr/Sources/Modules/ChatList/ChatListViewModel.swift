import UIKit

protocol ChatListViewModelProtocol {
  var dataSource: ChartListTableViewDataSource<ChatListCell, ChatListTableViewCell> { get set }
  func showChat(index: Int)
}

protocol ChatListViewModelDelegate: AnyObject {
  func ChatListViewModelDidRequestShowChat(_ viewModel: ChatListViewModel, with id: String)
}

struct ChatListCell {
  var image: UIImage?
  var title: String
  var description: String
}


final class ChatListViewModel: ChatListViewModelProtocol {
  // MARK: - Types
  typealias Dependencies = Any
  
  // MARK: - Properties
  weak var delegate: ChatListViewModelDelegate?
  
  var dataSource: ChartListTableViewDataSource<ChatListCell, ChatListTableViewCell>
  var models: [ChatListCell] = []
  // MARK: - Init
  init(dependencies: Dependencies) {
    let models = [ChatListCell(image: UIImage(named: "ava"),
                               title: "Mitchell",
                               description: "И согласно правил этой логики Ягода пока не показала что во..."),
                  ChatListCell(image: UIImage(named: "ava"),
                               title: "Alex",
                               description: "И согласно")]
    self.models = models
    
    dataSource = ChartListTableViewDataSource<ChatListCell,
                                              ChatListTableViewCell>(models: models,
                                                                     reuseIdentifier: ChatListTableViewCell.identifier) { model, cell in
                                                cell.configure(with: model)
                                              }
  }
  
  // MARK: - Public Methods
  func showChat(index: Int) {
    delegate?.ChatListViewModelDidRequestShowChat(self, with: models[index].title) // id
  }
  

  
  // MARK: - Actions
  
  // MARK: - Private Methods
}
