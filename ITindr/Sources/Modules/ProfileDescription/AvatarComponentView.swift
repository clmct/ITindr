import UIKit

final class AvatarComponentView: UIView {
  private let imageView = UIImageView()
  private let actionButton = UIButton(type: .system)
  
  // MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setup() {
    addSubview(imageView)
    imageView.snp.makeConstraints { make in
      make.leading.top.bottom.equalToSuperview()
      make.size.equalTo(88)
    }
    
    imageView.backgroundColor = .base2
    imageView.layer.cornerRadius = 44
    imageView.layer.masksToBounds = true
    
    addSubview(actionButton)
    actionButton.snp.makeConstraints { make in
      make.leading.equalTo(imageView.snp.trailing).offset(24)
      make.trailing.equalToSuperview()
      make.centerY.equalTo(imageView)
    }
    
    actionButton.setTitle("Выбрать фото")
    actionButton.setTitleFont(.body16)
    actionButton.setTitleColor(.base1)
    actionButton.contentHorizontalAlignment = .leading
  }
}
