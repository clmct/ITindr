import UIKit

final class AvatarComponentView: UIView {
  var onDidAction: VoidClosure?
  private let imageView = UIImageView()
  private let actionButton = UIButton(type: .system)
  private let defaultImage = R.image.defaultAva()
  // MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setPhoto(image: UIImage) {
    imageView.image = image
    actionButton.setTitle(R.string.localizable.deletePhoto())
  }
  
  func deletePhoto() {
    imageView.image = defaultImage
    actionButton.setTitle(R.string.localizable.choosePhoto())
  }
  
  @objc
  private func actionFunc() {
    if imageView.image == defaultImage {
      onDidAction?()
    } else {
      deletePhoto()
    }
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
    imageView.image = defaultImage
    imageView.contentMode = .scaleAspectFit
    
    addSubview(actionButton)
    actionButton.snp.makeConstraints { make in
      make.leading.equalTo(imageView.snp.trailing).offset(24)
      make.trailing.equalToSuperview()
      make.centerY.equalTo(imageView)
    }
    
    actionButton.setTitle("Выбрать фото")
    actionButton.setTitleFont(.bold16)
    actionButton.setTitleColor(.base1)
    actionButton.contentHorizontalAlignment = .leading
    
    actionButton.addTarget(self, action: #selector(actionFunc), for: .touchUpInside)
  }
}
