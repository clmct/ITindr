import UIKit
import Kingfisher

final class PeopleViewController: UIViewController {
  private let collectionView = UICollectionView(frame: .zero,
                                                collectionViewLayout: UICollectionViewFlowLayout())
  private let spacing: CGFloat = 16
  
  private let viewModel: PeopleViewModel
  
  // MARK: - Init
  init(viewModel: PeopleViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    bindToViewModel()
    viewModel.getPeople()
  }
  
  func bindToViewModel() {
    viewModel.onDidUpdate = { [unowned self] in
      self.collectionView.reloadData()
    }
  }
  
  private func setup() {
    view.addSubview(collectionView)
    collectionView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
    
    let layout = CustomCollectionViewLayout()
    collectionView.setCollectionViewLayout(layout, animated: true)
    
    collectionView.reloadData()
  }
}

extension PeopleViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.people.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier,
                                                        for: indexPath) as? CollectionViewCell else {
      return UICollectionViewCell()
    }
    cell.configure(user: viewModel.people[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    viewModel.showAboutUser()
  }
}

extension PeopleViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    let numberOfItemsPerRow: CGFloat = 3
    let spacingBetweenCells: CGFloat = 20
    let totalSpacing = (2 * spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)
    let width = (collectionView.bounds.width - totalSpacing) / numberOfItemsPerRow
    return CGSize(width: width, height: width + 40)
  }
}
