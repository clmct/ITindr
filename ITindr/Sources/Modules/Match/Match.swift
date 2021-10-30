import UIKit

final class MatchViewController: UIViewController {
  private var matchView: MatchView?
  var onDidAction: VoidClosure?
  
  override func loadView() {
    guard let matchView = matchView else { return }
    self.view = matchView
  }
  
  convenience init() {
    self.init(nibName: nil, bundle: nil)
    self.matchView = MatchView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    matchView?.onDidAction = { [weak self] in
      self?.onDidAction?()
    }
  }
}
