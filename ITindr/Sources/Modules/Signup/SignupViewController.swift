import UIKit

final class SignupViewController: UIViewController {
  // MARK: - Properties
  
  private let viewModel: SignupViewModelProtocol
  private let textField = CustomTextFiled()
  
  // MARK: - Init
  
  init(viewModel: SignupViewModelProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
  // MARK: - Public Methods
  
  // MARK: - Actions
  
  // MARK: - Private Methods

  private func bindToViewModel() {
  }
  
  private func setup() {
    view.backgroundColor = .base0
    
    bindToViewModel()
    view.addSubview(textField)
    textField.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(30)
      make.centerY.equalToSuperview()
    }
  }
}
