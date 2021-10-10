import UIKit

final class InterestsCollectionViewDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
  let items = ["Swift", "Python", "Objective c", "JS", "TS", "c++",
               "Javascript", "C", "Objective c", "Javascript", "Python", "Python",]
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InterestCollectionViewCell.identifier,
                                                        for: indexPath) as? InterestCollectionViewCell else {
              return UICollectionViewCell()
            }
    cell.configure(text: items[indexPath.row], isSelected: indexPath.row % 3 == 0)
    return cell
  }
}
