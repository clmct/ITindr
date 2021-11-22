import UIKit

final class UsersViewController: UIViewController, MatchShowingProtocol {
  // MARK: - Properties
  private var viewModel: UsersViewModelProtocol
  
  private let scrollView: TPKeyboardAvoidingScrollView = {
    let item = TPKeyboardAvoidingScrollView()
    return item
  }()
  
  private let contentView: UIView = {
    let item = UIView()
    return item
  }()

  private let logoImageView: UIImageView = {
    let item = UIImageView()
    item.image = R.image.logo()
    item.contentMode = .scaleAspectFit
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
    let item = InterestsComponentView(items: [Topic(id: "", title: "Swift", isSelect: false),
                                              Topic(id: "", title: "Pytnon", isSelect: false),
                                              Topic(id: "", title: "Swift", isSelect: false),
                                              Topic(id: "", title: "Swift", isSelect: false),
                                              Topic(id: "", title: "Swwewewift", isSelect: false),
                                              Topic(id: "", title: "Swift", isSelect: false),
                                              Topic(id: "", title: "ft", isSelect: false),
                                              Topic(id: "", title: "Swift", isSelect: false),
                                              Topic(id: "", title: "Swift", isSelect: false),
                                             ])
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
  
  private let rejectionButton: UIButton = {
    let item = ButtonFactory.makeWhiteButton()
    item.setTitle("Отказ")
    item.addLeftImage(image: R.image.reject(),
                      offset: 35)
    return item
  }()
  
  private let likeButton: UIButton = {
    let item = ButtonFactory.makePinkButton()
    item.setTitle("Лайк")
    item.addLeftImage(image: R.image.like(),
                      offset: 35)
    return item
  }()
  
  // MARK: - Init
  init(viewModel: UsersViewModelProtocol) {
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
    viewModel.onDidMatch = {
      self.showMV()
    }
  }
  
  func showMV() {
    tabBarController?.navigationController?.showMatchView {
      self.viewModel.writeMessage()
    }
  }
  
  @objc
  private func like() {
    viewModel.like()
    
  }
  
  @objc
  private func reject() {
    viewModel.reject()
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
    
    contentView.addSubview(rejectionButton)
    rejectionButton.snp.makeConstraints { make in
      make.leading.equalToSuperview().inset(16)
      make.trailing.equalTo(view.snp.centerX).offset(-8)
      make.bottom.equalToSuperview()
      make.height.equalTo(56)
    }
    
    contentView.addSubview(likeButton)
    likeButton.snp.makeConstraints { make in
      make.leading.equalTo(view.snp.centerX).offset(8)
      make.trailing.equalToSuperview().inset(16)
      make.bottom.equalToSuperview()
      make.height.equalTo(56)
    }
    
    view.layoutIfNeeded()
    
    rejectionButton.addTarget(self, action: #selector(reject), for: .touchUpInside)
    likeButton.addTarget(self, action: #selector(like), for: .touchUpInside)
  }
}


