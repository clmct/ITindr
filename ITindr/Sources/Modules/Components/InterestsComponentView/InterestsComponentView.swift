import UIKit

final class InterestsComponentView: UIView {
  public var height: Float {
    return Float(collectionView.collectionViewLayout.collectionViewContentSize.height)
  }
  
  public var items: Topics = []
  private lazy var leftAlignedCollectionViewFlowLayout = LeftAlignedCollectionViewFlowLayout()
  private lazy var collectionView = UICollectionView(frame: .zero,
                                                     collectionViewLayout: leftAlignedCollectionViewFlowLayout)
  
  private lazy var collectionViewDataSource = CollectionViewDataSource(items: items)
  
  init(items: Topics) {
    super.init(frame: .zero)
    self.items = items
    backgroundColor = .clear
    setup()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    collectionView.snp.remakeConstraints { make in
      make.edges.equalToSuperview()
      make.height.equalTo(height)
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .clear
    setup()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(items: Topics) {
    self.items = items
    collectionView.reloadData()
  }
  
  private func setup() {
    addSubview(collectionView)
    collectionView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    collectionView.backgroundColor = .clear
    
    collectionView.delegate = self
    collectionView.dataSource = collectionViewDataSource
    collectionView.register(InterestCollectionViewCell.self,
                            forCellWithReuseIdentifier: InterestCollectionViewCell.identifier)
//    collectionView.backgroundColor = .red
    collectionView.reloadData()
  }
}


extension InterestsComponentView: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    self.items[indexPath.row].isSelect!.toggle()
    collectionView.reloadData()
  }
}


final class CollectionViewDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
  private var items: Topics
  
  init(items: Topics) {
    self.items = items
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InterestCollectionViewCell.identifier,
                                                        for: indexPath) as? InterestCollectionViewCell else {
              return UICollectionViewCell()
            }
    cell.configure(text: items[indexPath.row].title, isSelected: items[indexPath.row].isSelect!)
//    cell.backgroundColor = .green
    return cell
  }
}
