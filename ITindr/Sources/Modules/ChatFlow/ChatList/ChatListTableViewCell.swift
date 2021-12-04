import UIKit

class ChatListTableViewCell: UITableViewCell, ConfigurableProtocol {
  static var identifier = "ChatListTableViewCell"
  
  private let chatImageView = UIImageView()
  private let titleLabel = UILabel()
  private let descriptionLabel = UILabel()
  private let lineView = UIView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(with model: ChatListCell) {
    let url = URL(string: model.image ?? "")
    chatImageView.kf.setImage(with: url)
    titleLabel.text = model.title
    descriptionLabel.text = model.description
  }
  
  private func setup() {
    setupChatImageView()
    setupTitleLabel()
    setupDescriptionLabel()
    setupLineView()
  }
  
  private func setupChatImageView() {
    contentView.addSubview(chatImageView)
    chatImageView.snp.makeConstraints { make in
      make.top.bottom.leading.equalToSuperview().inset(16)
      make.size.equalTo(64)
    }
    
    chatImageView.layer.cornerRadius = 32
    chatImageView.layer.masksToBounds = true
  }
  
  private func setupTitleLabel() {
    contentView.addSubview(titleLabel)
    titleLabel.snp.makeConstraints { make in
      make.leading.equalTo(chatImageView.snp.trailing).offset(16)
      make.trailing.equalToSuperview().inset(16)
      make.top.equalToSuperview().offset(16)
    }
    
    titleLabel.font = .bold16
    titleLabel.textColor = .base
  }
  
  private func setupDescriptionLabel() {
    contentView.addSubview(descriptionLabel)
    descriptionLabel.snp.makeConstraints { make in
      make.leading.equalTo(chatImageView.snp.trailing).offset(16)
      make.trailing.equalToSuperview().inset(16)
      make.top.equalTo(titleLabel.snp.bottom).offset(4)
      make.bottom.equalToSuperview().inset(16)
    }
    
    descriptionLabel.font = .regular16
    descriptionLabel.textColor = .base4
    descriptionLabel.numberOfLines = 2
  }
  
  private func setupLineView() {
    contentView.addSubview(lineView)
    lineView.snp.makeConstraints { make in
      make.bottom.equalToSuperview()
      make.leading.equalTo(chatImageView.snp.trailing).offset(16)
      make.trailing.equalToSuperview()
      make.height.equalTo(1)
    }
    
    lineView.backgroundColor = .base5
  }
}
