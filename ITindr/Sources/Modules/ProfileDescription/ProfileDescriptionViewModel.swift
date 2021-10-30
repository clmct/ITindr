import Foundation
import UIKit

protocol ProfileDescriptionViewModelDelegate: AnyObject {
  func profileDescriptionViewModelDidSave(_ viewModel: ProfileDescriptionViewModel)
  func profileDescriptionViewModelDidRequestShowImagePicker(_ viewModel: ProfileDescriptionViewModel)
}

final class ProfileDescriptionViewModel {
  typealias Dependencies = HasNetworkService
  weak var delegate: ProfileDescriptionViewModelDelegate?
  var onDidUpdatePhoto: ((UIImage) -> Void)?
  let dependencies: Dependencies
  var onDidUpdate: VoidClosure?
  var onDidError: VoidClosure?
  var topics: Topics = []
  var image: UIImage?
  
  init(dependencies: Dependencies) {
    self.dependencies = dependencies
  }
  
  // Coordinator input
  func updateImage(image: UIImage) {
    onDidUpdatePhoto?(image)
    self.image = image
  }
  
  func save(name: String, about: String, topics: Topics) {
    uploadImage()
    let topics = topics.compactMap { topic -> Topic? in
      if topic.isSelect {
        return topic
      } else {
        return nil
      }
    }
    let profile = Profile(userID: "", name: name, aboutMyself: about, avatar: "", topics: topics)
    dependencies.networkService.updateProfile(profile: profile) { result in
      switch result {
      case .success(let response):
        print(response)
        self.delegate?.profileDescriptionViewModelDidSave(self)
      case .failure(let error):
        print(error)
        self.onDidError?()
      }
    }

  }
  
  func uploadImage() {
    guard let image = image else {
      return
    }

    dependencies.networkService.uploadUserAvatar(avatar: image) { result in
      switch result {
      case .success(let response):
        print(response)
      case .failure(let error):
        print(error)
      }
    }
  }
  
  func showImagePicker() {
    delegate?.profileDescriptionViewModelDidRequestShowImagePicker(self)
  }
  
  func getTopics() {
    dependencies.networkService.getTopic { result in
      switch result {
      case .success(let response):
        self.topics = response
      case .failure(let error):
        print(error)
      }
      self.onDidUpdate?()
    }
  }
}
