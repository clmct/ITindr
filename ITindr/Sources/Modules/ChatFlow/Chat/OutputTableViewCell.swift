import UIKit

class OutputTableViewCell: UITableViewCell {
  static var identifier = "OutputTableViewCell"
  
  private let chatImageView = UIImageView()
  private let messageContentView = MessageContentView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(type: MessageCellType) {
    messageContentView.configure(type: type)
  }
  
  private func setup() {
    setupChatImageView()
    setupMessageContentView()
  }
  
  private func setupChatImageView() {
    contentView.addSubview(chatImageView)
    chatImageView.snp.makeConstraints { make in
      make.trailing.equalToSuperview().inset(16)
      make.bottom.equalToSuperview().inset(24)
      make.size.equalTo(32)
    }
    
    chatImageView.layer.cornerRadius = 16
    chatImageView.layer.masksToBounds = true
    chatImageView.image = R.image.ava()
  }
  
  private func setupMessageContentView() {
    contentView.addSubview(messageContentView)
    messageContentView.snp.makeConstraints { make in
      make.trailing.equalTo(chatImageView.snp.leading).offset(-8)
      make.bottom.equalTo(chatImageView)
      make.top.equalToSuperview()
      make.leading.greaterThanOrEqualToSuperview().offset(bounds.width * 1 / 3)
    }
    
    messageContentView.backgroundColor = .base2
    messageContentView.layer.cornerRadius = 8
    messageContentView.layer.maskedCorners = [.layerMaxXMinYCorner,
                                              .layerMinXMinYCorner,
                                              .layerMinXMaxYCorner]
  }
}
