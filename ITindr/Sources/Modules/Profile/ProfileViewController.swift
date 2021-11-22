import UIKit

final class ProfileViewController: UIViewController {
  // MARK: - Properties
  private let viewModel: ProfileViewModelProtocol
  
  private let scrollView: TPKeyboardAvoidingScrollView = {
    let item = TPKeyboardAvoidingScrollView()
    return item
  }()
  
  private let contentView: UIView = {
    let item = UIView()
    return item
  }()
  
  private let avatarImageView: UIImageView = {
    let item = UIImageView()
    item.image = R.image.avatar()
    item.contentMode = .scaleAspectFit
    return item
  }()
  
  private let nameLabel: UILabel = {
    let item = UILabel()
    item.text = "Андрей Иванов"
    item.textColor = .base
    item.font = .bold24
    item.textAlignment = .center
    return item
  }()
  
  private let interestsComponentView: InterestsComponentView = {
    let item = InterestsComponentView(items: [])
    return item
  }()
  
  private let descriptionLabel: UILabel = {
    let item = UILabel()
    item.text = "Люблю программировать на питоне. Люблю изучать питон. Люблю всё, что угодно, связанное с питоном. А еще я люблю перл."
    item.numberOfLines = .zero
    item.textAlignment = .center
    return item
  }()
  
  private let spaceView = UILabel()
  
  private let editButton: UIButton = {
    let item = ButtonFactory.makeWhiteButton()
    item.setTitle(R.string.localizable.edit())
    item.addLeftImage(image: R.image.edit(),
                      offset: 35)
    return item
  }()
  
  // MARK: - Init
  init(viewModel: ProfileViewModelProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Lifecycle
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    editButton.updateGradientFrame()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    bindToViewModel()
    title = "Профиль"
  }
  
  // MARK: - Public Methods
  
  // MARK: - Actions
  
  // MARK: - Private Methods
  private func bindToViewModel() {
  }
  
  @objc
  private func edit() {
    viewModel.showEdit()
  }
  
  private func setup() {
    view.backgroundColor = .base0
    setupLayout()
  }
  
  private func setupContentView() {
    view.addSubview(scrollView)
    scrollView.snp.makeConstraints { make in
      make.edges.width.equalToSuperview()
    }
    
    scrollView.addSubview(contentView)
    contentView.snp.makeConstraints { make in
      make.edges.width.equalToSuperview()
      make.height.equalTo(view).inset(40).priority(.low)
    }
  }
  
  private func setupLayout() {
    setupContentView()
    
    contentView.addSubview(avatarImageView)
    avatarImageView.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(43)
      make.leading.trailing.equalToSuperview().inset(85)
      make.height.equalTo(avatarImageView.snp.width)
    }
    
    avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
    avatarImageView.layer.masksToBounds = true
    
    contentView.addSubview(nameLabel)
    nameLabel.snp.makeConstraints { make in
      make.top.equalTo(avatarImageView.snp.bottom).offset(30)
      make.leading.trailing.equalToSuperview()
    }
    
    contentView.addSubview(interestsComponentView)
    interestsComponentView.snp.makeConstraints { make in
      make.top.equalTo(nameLabel.snp.bottom).offset(16)
      make.leading.trailing.equalToSuperview().inset(40)
    }
    
    contentView.addSubview(descriptionLabel)
    descriptionLabel.snp.makeConstraints { make in
      make.top.equalTo(interestsComponentView.snp.bottom)
      make.leading.trailing.equalToSuperview().inset(16)
    }
    
    
    contentView.addSubview(spaceView)
    spaceView.snp.makeConstraints { make in
      make.top.equalTo(descriptionLabel.snp.bottom)
      make.leading.trailing.equalToSuperview()
    }
    
    contentView.addSubview(editButton)
    editButton.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(70)
      make.trailing.equalToSuperview().inset(70)
      make.bottom.equalToSuperview()
      make.height.equalTo(56)
    }
    
    editButton.addTarget(self, action: #selector(edit), for: .touchUpInside)
    
    view.layoutIfNeeded()
  }
}


