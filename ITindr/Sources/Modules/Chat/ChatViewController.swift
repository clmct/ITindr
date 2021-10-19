import UIKit

final class ChatViewController: UIViewController {
  // MARK: - Properties
  private let viewModel: ChatViewModelProtocol
  
  private let tableView = UITableView()
  
  // MARK: - Init
  init(viewModel: ChatViewModelProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    bindToViewModel()
  }
  
  // MARK: - Public Methods
  
  // MARK: - Actions
  
  // MARK: - Private Methods
  private func bindToViewModel() {
  }
  
  private func setupTableView() {
    view.addSubview(tableView)
    tableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 300
    tableView.separatorStyle = .none
    tableView.register(InputTableViewCell.self,
                       forCellReuseIdentifier: InputTableViewCell.identifier)
    tableView.register(OutputTableViewCell.self,
                       forCellReuseIdentifier: OutputTableViewCell.identifier)
    
    tableView.dataSource = self
//    tableView.delegate = self
    tableView.reloadData()
  }
}

extension ChatViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    15
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: InputTableViewCell.identifier,
                                                   for: indexPath) as? InputTableViewCell else {
      let cell = UITableViewCell()
      return cell
    }
    if indexPath.row % 3 == 0 {
      cell.configure(type: .text)
    } else {
      cell.configure(type: .image)
    }
    
    return cell
    
  }
  
  
}
