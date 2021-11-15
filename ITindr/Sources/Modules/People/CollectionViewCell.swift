import UIKit

final class CollectionViewCell: UICollectionViewCell {
  static let identifier = "CollectionViewCell"
  private let imageView = UIImageView()
  private let titleLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
    imageView.image = R.image.ava()
    titleLabel.text = "Max"
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
      super.layoutSubviews()
      imageView.layer.cornerRadius = imageView.frame.size.width/2.0
  }
  
  func configure(user: Profile) {
    let url = URL(string: user.avatar ?? "")
    imageView.kf.setImage(with: url)
    titleLabel.text = user.name
  }
  
  private func setup() {
    contentView.addSubview(imageView)
    contentView.addSubview(titleLabel)
    
    imageView.snp.makeConstraints { make in
      make.leading.trailing.top.equalToSuperview()
      make.height.equalTo(imageView.snp.width)
    }
    
    imageView.layer.masksToBounds = true
    
    titleLabel.snp.makeConstraints { make in
      make.top.equalTo(imageView.snp.bottom).offset(10)
      make.leading.trailing.bottom.equalToSuperview()
    }
    
    titleLabel.textColor = .base
    titleLabel.font = .bold16
    titleLabel.textAlignment = .center
    layoutIfNeeded()
  }
}
