import UIKit
import TagListView

final class InterestsComponentView2 {
  private let tagListView = TagListView()
  
  func configure() {
    tagListView.addTags(["Swift", "Python", "Objective c"])
  }
}
