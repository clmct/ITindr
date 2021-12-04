import UIKit

final class ChatListViewController: UIViewController {
  // MARK: - Properties
  private var viewModel: ChatListViewModelProtocol
  
  private let tableView = UITableView()
  
  // MARK: - Init
  init(viewModel: ChatListViewModelProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .base0
    bindToViewModel()
    setupTableView()
    title = "Чаты"
    viewModel.getList()
    viewModel.saveChats()
  }
  
  // MARK: - Public Methods
  
  // MARK: - Actions
  
  // MARK: - Private Methods
  private func bindToViewModel() {
    viewModel.onDidUpdate = { [unowned self] in
      self.tableView.dataSource = viewModel.dataSource
      self.tableView.reloadData()
    }
  }
  
  private func setupTableView() {
    view.addSubview(tableView)
    tableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    tableView.separatorStyle = .none
    tableView.register(ChatListTableViewCell.self,
                       forCellReuseIdentifier: ChatListTableViewCell.identifier)
    
    tableView.dataSource = viewModel.dataSource
    tableView.delegate = self
    tableView.reloadData()
  }
}

extension ChatListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 95
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    viewModel.showChat(index: indexPath.row)
  }
}


