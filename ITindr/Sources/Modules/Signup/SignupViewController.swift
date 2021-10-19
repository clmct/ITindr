import UIKit

final class SignupViewController: UIViewController {
  // MARK: - Properties
  
  private let viewModel: SignupViewModelProtocol
  
  private let contentView: UIView = {
    let item = UIView()
    return item
  }()

  private let logoImageView: UIImageView = {
    let item = UIImageView()
    item.image = UIImage(named: "logo")
    item.contentMode = .scaleAspectFit
    return item
  }()
  
  private let titleLabel: UILabel = {
    let item = UILabel()
    item.text = "Регистрация"
    item.textColor = .base1
    item.font = .bold24
    return item
  }()
  
  private let emailTextField: CustomTextFiled = {
    let item = CustomTextFiled()
    let attributedString = NSAttributedString(string: "E-mail",
                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.base3])
    item.setAttributedPlaceholder(attributedString: attributedString)
    return item
  }()
  
  private let passwordTextField: CustomTextFiled = {
    let item = CustomTextFiled()
    let attributedString = NSAttributedString(string: "Пароль",
                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.base3])
    item.setAttributedPlaceholder(attributedString: attributedString)
    item.setIsSecureTextEntry(true)
    return item
  }()
  
  private let repeatPasswordTextField: CustomTextFiled = {
    let item = CustomTextFiled()
    let attributedString = NSAttributedString(string: "Повторите пароль",
                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.base3])
    item.setIsSecureTextEntry(true)
    item.setAttributedPlaceholder(attributedString: attributedString)
    return item
  }()
  
  private let signupButton: UIButton = {
    let item = ButtonFactory.makePinkButton()
    item.setTitle("Зарегистрироваться")
    return item
  }()
  
  private let backButton: UIButton = {
    let item = ButtonFactory.makeWhiteButton()
    item.setTitle("Назад")
    return item
  }()
  
  // MARK: - Init
  
  init(viewModel: SignupViewModelProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Lifecycle
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    signupButton.updateGradientFrame()
  }

  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
  // MARK: - Public Methods
  
  // MARK: - Actions
  
  @objc
  private func back() {
    navigationController?.popViewController(animated: true)
  }
  
  @objc
  private func signup() {
    viewModel.signup()
  }
  
  // MARK: - Private Methods

  private func bindToViewModel() {
  }
  
  private func setup() {
    view.backgroundColor = .base0
    setupLayout()
  }
  
  private func setupLayout() {
    setupContentView()
    
    contentView.addSubview(logoImageView)
    logoImageView.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(43)
      make.centerX.equalToSuperview()
      make.height.equalTo(45)
      make.width.equalTo(165)
    }
    
    contentView.addSubview(titleLabel)
    titleLabel.snp.makeConstraints { make in
      make.top.equalTo(logoImageView.snp.bottom).offset(50)
      make.leading.leading.trailing.equalToSuperview().inset(16)
    }
    
    contentView.addSubview(emailTextField)
    emailTextField.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom).offset(16)
      make.leading.leading.trailing.equalToSuperview().inset(16)
      make.height.equalTo(56)
    }
    
    contentView.addSubview(passwordTextField)
    passwordTextField.snp.makeConstraints { make in
      make.top.equalTo(emailTextField.snp.bottom).offset(16)
      make.leading.leading.trailing.equalToSuperview().inset(16)
      make.height.equalTo(56)
    }
    
    contentView.addSubview(repeatPasswordTextField)
    repeatPasswordTextField.snp.makeConstraints { make in
      make.top.equalTo(passwordTextField.snp.bottom).offset(16)
      make.leading.leading.trailing.equalToSuperview().inset(16)
      make.height.equalTo(56)
    }
    
    // bottom
    contentView.addSubview(backButton)
    backButton.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(16)
      make.bottom.equalToSuperview().inset(50)
      make.height.equalTo(56)
    }
    backButton.layoutIfNeeded()
    
    contentView.addSubview(signupButton)
    signupButton.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(16)
      make.bottom.equalTo(backButton.snp.top).offset(-16)
      make.height.equalTo(56)
    }
    signupButton.layoutIfNeeded()
    
    signupButton.addTarget(self, action: #selector(signup), for: .touchUpInside)
    backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
  }
  
  private func setupContentView() {
    view.addSubview(contentView)
    contentView.snp.makeConstraints { make in
      make.edges.width.equalToSuperview()
    }
  }
}
