import UIKit

final class AboutUserViewController: UIViewController {
  
  private let viewModel: AboutUserViewModel
  private let imageView = UIImageView()
  private let nameLabel = UILabel()
  private let descriptionLabel = UILabel()
  
  // MARK: - Init
  init(viewModel: AboutUserViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.setNavigationBarHidden(true, animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.tintColor = .white
    setup()
    viewModel.onDidUpdate = { [unowned self] in
      guard let profile = viewModel.profile else { return }
      self.nameLabel.text = profile.name
      self.descriptionLabel.text = profile.aboutMyself
      let url = URL(string: profile.avatar ?? "")
      self.imageView.kf.setImage(with: url)
    }
    viewModel.getInfo()
  }
  
  private func setup() {
    setupImageView()
    setupDescriptionLabel()
    setupNameLabel()
  }
  
  private func setupImageView() {
    view.addSubview(imageView)
    imageView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    imageView.contentMode = .scaleAspectFill
  }
  
  private func setupNameLabel() {
    view.addSubview(nameLabel)
    nameLabel.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(16)
      make.bottom.equalTo(descriptionLabel.snp.top).offset(-8)
    }
    
    nameLabel.textColor = .base0
    nameLabel.font = .bold24
    nameLabel.textAlignment = .left
  }
  
  private func setupDescriptionLabel() {
    view.addSubview(descriptionLabel)
    descriptionLabel.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(16)
      make.bottom.equalToSuperview().offset(-16)
    }
    
    descriptionLabel.textColor = .base0
    descriptionLabel.font = .regular16
    descriptionLabel.textAlignment = .left
    descriptionLabel.numberOfLines = 2
  }
}
