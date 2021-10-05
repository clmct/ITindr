//
//  WelcomeViewController.swift
//  ITindr
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
  
  private let scrollView = UIScrollView()
  private let contentView = UIView()
  private let logoImageView = UIImageView()
  private let descriptionLabel = UILabel()
  private let peopleImageView = UIImageView()
  private let signupButton = UIButton()
  private let loginButton = UIButton()
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
  
  private func setup() {
    setupLayout()
    view.backgroundColor = .red
  }
  
  private func setupLayout() {
    setupScrollView()
  }
  
  private func setupScrollView() {
    view.addSubview(scrollView)
    scrollView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    scrollView.addSubview(contentView)
    contentView.snp.makeConstraints { make in
      make.edges.width.equalToSuperview()
    }
  }
}

