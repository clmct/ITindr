import UIKit

final class ProfileViewController: UIViewController {
  // MARK: - Properties
  private let viewModel: ProfileViewModelProtocol
  
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
  
  private let avatarImageView: UIImageView = {
    let item = UIImageView()
    item.image = UIImage(named: "avatar")
    item.contentMode = .scaleAspectFit
    return item
  }()
  
  private let nameLabel: UILabel = {
    let item = UILabel()
    item.text = "Андрей Иванов"
    return item
  }()
  
  private let interestsComponentView: InterestsComponentView = {
    let item = InterestsComponentView(items: ["Swift", "Python", "Objective c"])
    return item
  }()
  
  private let descriptionLabel: UILabel = {
    let item = UILabel()
    item.text = "Люблю программировать на питоне. Люблю изучать питон. Люблю всё, что угодно, связанное с питоном. А еще я люблю перл."
    item.numberOfLines = .zero
    item.textAlignment = .center
    return item
  }()
  
  private let rejectionButton: UIButton = {
    let item = ButtonFactory.makeWhiteButton()
    item.setTitle("Отказ")
    item.addLeftImage(image: UIImage(named: "reject"), offset: 35)
    return item
  }()
  
  private let likeButton: UIButton = {
    let item = ButtonFactory.makePinkButton()
    item.setTitle("Лайк")
    item.addLeftImage(image: UIImage(named: "like"), offset: 35)
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
    likeButton.updateGradientFrame()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    bindToViewModel()
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
  
  private func setupLayout() {
    setupContentView()
    
    contentView.addSubview(logoImageView)
    logoImageView.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(43)
      make.centerX.equalToSuperview()
      make.height.equalTo(45)
      make.width.equalTo(165)
    }
    
    contentView.addSubview(avatarImageView)
    avatarImageView.snp.makeConstraints { make in
      make.top.equalTo(logoImageView.snp.bottom).offset(43)
      make.leading.trailing.equalToSuperview().inset(85)
      make.height.equalTo(avatarImageView.snp.width)
    }
    
    avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
    avatarImageView.layer.masksToBounds = true
    
    contentView.addSubview(interestsComponentView)
    interestsComponentView.snp.makeConstraints { make in
      make.top.equalTo(avatarImageView.snp.bottom).offset(16)
      make.leading.trailing.equalToSuperview().inset(40)
    }
    
    contentView.addSubview(descriptionLabel)
    descriptionLabel.snp.makeConstraints { make in
      make.top.equalTo(interestsComponentView.snp.bottom)
      make.leading.trailing.equalToSuperview().inset(16)
    }
    
    contentView.addSubview(rejectionButton)
    rejectionButton.snp.makeConstraints { make in
      make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
      make.leading.equalToSuperview().inset(16)
      make.trailing.equalTo(view.snp.centerX).inset(8)
      make.height.equalTo(56)
    }
    
    contentView.addSubview(likeButton)
    likeButton.snp.makeConstraints { make in
      make.top.greaterThanOrEqualTo(descriptionLabel.snp.bottom).offset(20)
      make.bottom.equalToSuperview().inset(20)
      make.leading.equalTo(view.snp.centerX).inset(8)
      make.trailing.equalToSuperview().inset(16)
      make.height.equalTo(56)
    }
  }
}


