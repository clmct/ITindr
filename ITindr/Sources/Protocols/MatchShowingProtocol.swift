import UIKit

extension UINavigationController: MatchShowingProtocol {}

protocol  MatchShowingProtocol {}

extension MatchShowingProtocol where Self: UINavigationController {
  func showMatchViewController(completion: @escaping () -> Void) {
    let matchView = MatchViewController()
    matchView.onDidAction = { [weak self] in
      self?.dismiss(animated: true, completion: nil)
      completion()
    }
    matchView.modalPresentationStyle = .fullScreen
    present(matchView, animated: true, completion: nil)
  }
}

extension MatchShowingProtocol where Self: UIViewController {
  func showMatchView(completion: @escaping () -> Void) {
    
    let matchView = MatchView(frame: UIScreen.main.bounds)
    matchView.onDidAction = { [weak matchView] in
      matchView?.removeFromSuperview()
      completion()
    }
    view.addSubview(matchView)
  }
}


