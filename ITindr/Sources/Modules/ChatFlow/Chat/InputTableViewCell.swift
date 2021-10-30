import UIKit

class InputTableViewCell: UITableViewCell {
  static var identifier = "InputTableViewCell"
  
  private let chatImageView = UIImageView()
  private let messageContentView = MessageContentView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(type: MessageCellType) {
    switch type {
    case .text:
      setupInput()
    case .image:
      setupOutput()
    }
    
    messageContentView.configure(type: type)
    
    
  }
  
  private func setupInput() {
    setupChatImageInputView()
    setupMessageContentInputView()
  }
  
  private func setupOutput() {
    setupChatImageOutputView()
    setupMessageContentOutputView()
  }
  
  private func setupChatImageInputView() {
    contentView.addSubview(chatImageView)
    chatImageView.snp.remakeConstraints { make in
      make.leading.equalToSuperview().offset(16)
      make.bottom.equalToSuperview().inset(24)
      make.size.equalTo(32)
    }
    
    chatImageView.layer.cornerRadius = 16
    chatImageView.layer.masksToBounds = true
    chatImageView.image = R.image.ava()
  }
  
  private func setupMessageContentInputView() {
    contentView.addSubview(messageContentView)
    messageContentView.snp.remakeConstraints { make in
      make.leading.equalTo(chatImageView.snp.trailing).offset(8)
      make.bottom.equalTo(chatImageView)
      make.top.equalToSuperview()
      make.trailing.lessThanOrEqualToSuperview().inset(bounds.width * 1 / 3)
    }
    
    messageContentView.backgroundColor = .base0
    messageContentView.layer.cornerRadius = 8
    messageContentView.layer.borderWidth = 1
    messageContentView.layer.borderColor = UIColor.base6.cgColor
    messageContentView.layer.maskedCorners = [.layerMaxXMinYCorner,
                                              .layerMinXMinYCorner,
                                              .layerMaxXMaxYCorner]
  }
  
  private func setupChatImageOutputView() {
    contentView.addSubview(chatImageView)
    chatImageView.snp.remakeConstraints { make in
      make.trailing.equalToSuperview().inset(16)
      make.bottom.equalToSuperview().inset(24)
      make.size.equalTo(32)
    }
    
    chatImageView.layer.cornerRadius = 16
    chatImageView.layer.masksToBounds = true
    chatImageView.image = R.image.ava()
  }
  
  private func setupMessageContentOutputView() {
    contentView.addSubview(messageContentView)
    messageContentView.snp.remakeConstraints { make in
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
