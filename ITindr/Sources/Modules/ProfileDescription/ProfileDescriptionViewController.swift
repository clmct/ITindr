import UIKit

final class ProfileDescriptionViewController: UIViewController {
  // MARK: - Properties
  
  private let viewModel: ProfileDescriptionViewModelProtocol
  
  private let scrollView: UIScrollView = {
    let item = UIScrollView()
    return item
  }()
  
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
    item.text = "Расскажи о себе"
    item.textColor = .base1
    item.font = .body24
    return item
  }()
  
  private let avatarView: AvatarComponentView = {
    let item = AvatarComponentView()
    return item
  }()
  
  private let nameTextField: CustomTextFiled = {
    let item = CustomTextFiled()
    let attributedString = NSAttributedString(string: "Имя",
                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor.base3])
    item.setAttributedPlaceholder(attributedString: attributedString)
    return item
  }()
  
  private let descriptionTextView: UITextView = {
    let item = UITextView()
    item.layer.cornerRadius = 28
    item.backgroundColor = .base2
    return item
  }()
  
  private let interestsTitle: UILabel = {
    let item = UILabel()
    item.text = "Укажи интересы"
    item.textColor = .base1
    item.font = .body24
    return item
  }()
  
  private let interestsComponentView: InterestsComponentView = {
    let item = InterestsComponentView()
    return item
  }()
  
  private let saveButton: UIButton = {
    let item = ButtonFactory.makePinkButton()
    item.setTitle("Сохранить")
    return item
  }()
  
  // MARK: - Init
  
  init(viewModel: ProfileDescriptionViewModelProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Lifecycle
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    saveButton.updateGradientFrame()
  }

  
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
    setupLayout()
  }
  
  private func setupLayout() {
    setupContentView()
    
    contentView.addSubview(logoImageView)
    logoImageView.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(43)
      make.centerX.equalToSuperview()
      make.height.equalTo(45)
      make.width.equalTo(165)
    }
    
    contentView.addSubview(titleLabel)
    titleLabel.snp.makeConstraints { make in
      make.top.equalTo(logoImageView.snp.bottom).offset(50)
      make.leading.leading.trailing.equalToSuperview().inset(16)
    }
    
    contentView.addSubview(avatarView)
    avatarView.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom).offset(18)
      make.leading.trailing.equalToSuperview().inset(16)
      make.size.equalTo(88)
    }
    
    contentView.addSubview(nameTextField)
    nameTextField.snp.makeConstraints { make in
      make.top.equalTo(avatarView.snp.bottom).offset(16)
      make.leading.leading.trailing.equalToSuperview().inset(16)
      make.height.equalTo(56)
    }
    
    contentView.addSubview(descriptionTextView)
    descriptionTextView.snp.makeConstraints { make in
      make.top.equalTo(nameTextField.snp.bottom).offset(16)
      make.leading.trailing.equalToSuperview().inset(16)
      make.height.equalTo(128)
    }
    
    contentView.addSubview(interestsTitle)
    interestsTitle.snp.makeConstraints { make in
      make.top.equalTo(descriptionTextView.snp.bottom).offset(24)
      make.leading.trailing.equalToSuperview().inset(16)
    }
    
    contentView.addSubview(interestsComponentView)
    interestsComponentView.snp.makeConstraints { make in
      make.top.equalTo((interestsTitle).snp.bottom).offset(16)
      make.leading.leading.trailing.equalToSuperview().inset(16)
      make.height.equalTo(100)
    }
    
    contentView.addSubview(saveButton)
    saveButton.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(16)
      make.top.equalTo(interestsComponentView.snp.bottom).offset(45)
      make.height.equalTo(56)
      make.bottom.equalToSuperview().inset(16)
    }
    saveButton.layoutIfNeeded()
  }
  
  private func setupContentView() {
    view.addSubview(scrollView)
    scrollView.snp.makeConstraints { make in
      make.edges.width.equalToSuperview()
    }
    
    scrollView.addSubview(contentView)
    contentView.snp.makeConstraints { make in
      make.edges.width.equalToSuperview()
    }
  }
}

