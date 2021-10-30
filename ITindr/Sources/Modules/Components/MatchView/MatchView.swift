import UIKit

final class MatchView: UIView {
  var onDidAction: VoidClosure?
  let imageView = UIImageView()
  let titleLabel = UILabel()
  
  let actionButton: UIButton = {
    let item = ButtonFactory.makePinkButton()
    item.setTitle(R.string.localizable.writeMessage())
    return item
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    actionButton.updateGradientFrame()
  }
  
  @objc
  private func actionFunc() {
    onDidAction?()
  }
  
  func setup() {
    backgroundColor = .base.withAlphaComponent(0.6)
    
    addSubview(imageView)
    imageView.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(160)
      make.leading.trailing.equalToSuperview().inset(35)
    }
    
    imageView.image = R.image.itsamatcH()
    
    addSubview(titleLabel)
    titleLabel.snp.makeConstraints { make in
      make.top.equalTo(imageView.snp.bottom).offset(10)
      make.centerX.equalToSuperview()
    }
    
    titleLabel.text = R.string.localizable.matchTitle()
    titleLabel.textAlignment = .center
    titleLabel.numberOfLines = 3
    titleLabel.textColor = .base0
    titleLabel.font = .bold16
    
    addSubview(actionButton)
    actionButton.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(16)
      make.bottom.equalToSuperview().inset(50)
      make.height.equalTo(56)
    }
    actionButton.layoutIfNeeded()
    
    actionButton.addTarget(self, action: #selector(actionFunc), for: .touchUpInside)
    
  }
  
}
