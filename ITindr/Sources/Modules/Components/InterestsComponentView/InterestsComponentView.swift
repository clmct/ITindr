import UIKit

final class InterestsComponentView: UIView {
  public var height: Float {
    return Float(collectionView.collectionViewLayout.collectionViewContentSize.height)
  }
  
  public var items: [String] = []
  private lazy var leftAlignedCollectionViewFlowLayout = LeftAlignedCollectionViewFlowLayout()
  private lazy var collectionView = UICollectionView(frame: .zero,
                                                     collectionViewLayout: leftAlignedCollectionViewFlowLayout)
  
  private lazy var collectionViewDataSource = CollectionViewDataSource(items: items)
  
  init(items: [String]) {
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
  
  private func setup() {
    addSubview(collectionView)
    collectionView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    collectionView.backgroundColor = .clear
    
    collectionView.delegate = collectionViewDataSource
    collectionView.dataSource = collectionViewDataSource
    collectionView.register(InterestCollectionViewCell.self,
                            forCellWithReuseIdentifier: InterestCollectionViewCell.identifier)
//    collectionView.backgroundColor = .red
    collectionView.reloadData()
  }
  
}

final class CollectionViewDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
  private let items: [String]
  
  init(items: [String]) {
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
    cell.configure(text: items[indexPath.row], isSelected: indexPath.row % 3 == 0)
    cell.backgroundColor = .green
    return cell
  }
}
