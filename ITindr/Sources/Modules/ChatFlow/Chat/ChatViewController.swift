import UIKit

final class ChatViewController: UIViewController {
  // MARK: - Properties
  override var inputAccessoryView: UIView? {
    return inputContainerView
  }
  
  lazy var inputContainerView: UIView = {
    let containerView = UIView()
    containerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 80)
    containerView.autoresizingMask = [.flexibleHeight]
    containerView.translatesAutoresizingMaskIntoConstraints = false
    containerView.backgroundColor = .base0
    let textField = UITextField()
    textField.placeholder = "Enter message..."
    textField.translatesAutoresizingMaskIntoConstraints = false
    containerView.addSubview(textField)
    textField.delegate = self
    textField.returnKeyType = UIReturnKeyType.send
    textField.textColor = .black
    textField.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 30).isActive = true
    textField.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -30).isActive = true
    textField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15).isActive = true
    textField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true
    return containerView
  }()
  
  override var canBecomeFirstResponder: Bool { return true }
  
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
    title = "Name"
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    viewModel.viewWillAppear()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    viewModel.viewWillDisappear()
  }
  // MARK: - Public Methods
  
  // MARK: - Actions
  
  // MARK: - Private Methods
  private func bindToViewModel() {
  }
  
  private func setupTableView() {
    view.backgroundColor = .base0
    view.addSubview(tableView)
    tableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
      make.bottom.equalToSuperview().inset(80)
    }
    
    tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 300
    tableView.separatorStyle = .none
    tableView.register(InputTableViewCell.self,
                       forCellReuseIdentifier: InputTableViewCell.identifier)
    tableView.register(OutputTableViewCell.self,
                       forCellReuseIdentifier: OutputTableViewCell.identifier)
    
    tableView.dataSource = self
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

// MARK: UITextFieldDelegate
extension ChatViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if let message = textField.text {
      textField.text = ""
    }
    return true
  }
}
