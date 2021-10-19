import UIKit

enum MessageCellType {
  case text
  case image
}

final class MessageContentView: UIView {
  private let messageImageView = UIImageView()
  private let messageLabel = UILabel()
  private let dateLabel = UILabel()

  init() {
    super.init(frame: .zero)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  func configure(type: MessageCellType) {
    setup(type: type)
  }
  
  private func setup(type: MessageCellType) {
    setupDateLabel()
    switch type {
    case .text:
      setupMessageLabel()
      messageImageView.removeFromSuperview()
    case .image:
      setupMessageImageView()
      messageLabel.removeFromSuperview()
      
    }
    
    messageLabel.text = "Приезжай ко мне, займемся парным программированием 😏"
    dateLabel.text = "13:03 • 23 августа 2021"
    messageImageView.image = UIImage(named: "avatar")
  }
  
  private func setupDateLabel() {
    addSubview(dateLabel)
    dateLabel.snp.remakeConstraints { make in
      make.bottom.leading.trailing.equalToSuperview().inset(16)
      make.height.equalTo(16)
    }
    
    dateLabel.font = .regular12
    dateLabel.textColor = .base3
    dateLabel.numberOfLines = 1
  }
  
  private func setupMessageLabel() {
    addSubview(messageLabel)
    messageLabel.snp.remakeConstraints { make in
      make.bottom.equalTo(dateLabel.snp.top).offset(-4)
      make.leading.trailing.top.equalToSuperview().inset(16)
    }
    
    messageLabel.font = .regular16
    messageLabel.textColor = .base
    messageLabel.numberOfLines = .zero
    messageLabel.lineBreakMode = .byWordWrapping
  }
  
  private func setupMessageImageView() {
    addSubview(messageImageView)
    messageImageView.snp.remakeConstraints { make in
      make.bottom.equalTo(dateLabel.snp.top).offset(-4)
      make.leading.trailing.top.equalToSuperview().inset(8)
    }
    
    messageImageView.layer.cornerRadius = 4
    messageImageView.layer.masksToBounds = true
    messageImageView.contentMode = .scaleAspectFit
  }
}
