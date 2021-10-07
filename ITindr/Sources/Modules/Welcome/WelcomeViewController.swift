import UIKit
import SnapKit

final class WelcomeViewController: UIViewController {
  // MARK: - Properties
  
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
  
  private let descriptionLabel: UILabel = {
    let item = UILabel()
    item.text = "Ты найдешь того, кто\n поревьюит твой код"
    item.textAlignment = .center
    item.numberOfLines = 2
    item.font = .body16
    item.textColor = .base1
    return item
  }()
  
  private let peopleImageView: UIImageView = {
    let item = UIImageView()
    item.image = UIImage(named: "people")
    item.contentMode = .scaleAspectFit
    return item
  }()
  
  private let signupButton: UIButton = {
    let item = ButtonFactory.makePinkButton()
    item.setTitle("Зарегистрироваться")
    return item
  }()
  
  private let loginButton: UIButton = {
    let item = ButtonFactory.makeWhiteButton()
    item.setTitle("Войти")
    return item
  }()
  
  // MARK: - Lifecycle
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    signupButton.updateGradientFrame()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
  // MARK: - Private Methods
  
  private func setup() {
    view.backgroundColor = .base0
    setupLayout()
  }
  
  private func setupLayout() {
    setupContentView()
    
    contentView.addSubview(peopleImageView)
    peopleImageView.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.leading.trailing.equalToSuperview().inset(30)
    }
    
    contentView.addSubview(descriptionLabel)
    descriptionLabel.snp.makeConstraints { make in
      make.bottom.equalTo(peopleImageView.snp.top).offset(-64)
      make.leading.trailing.equalToSuperview().inset(30)
    }
    
    contentView.addSubview(logoImageView)
    logoImageView.snp.makeConstraints { make in
      make.bottom.equalTo(descriptionLabel.snp.top).offset(-10)
      make.centerX.equalToSuperview()
      make.height.equalTo(45)
      make.width.equalTo(165)
    }
    
    contentView.addSubview(loginButton)
    loginButton.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(16)
      make.bottom.equalToSuperview().inset(50)
      make.height.equalTo(56)
    }
    loginButton.layoutIfNeeded()
    
    contentView.addSubview(signupButton)
    signupButton.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(16)
      make.bottom.equalTo(loginButton.snp.top).offset(-16)
      make.height.equalTo(56)
    }
    signupButton.layoutIfNeeded()
  }
  
  private func setupContentView() {
    view.addSubview(contentView)
    contentView.snp.makeConstraints { make in
      make.edges.width.equalToSuperview()
    }
  }
  
}

