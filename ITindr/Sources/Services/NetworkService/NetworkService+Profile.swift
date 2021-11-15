import UIKit

extension NetworkService {
  func getProfile(completion: @escaping (Result<Profile, NetworkError>) -> Void) {
    let url = URLFactory.Profile.profile
    let token = TOKEN ?? ""
    let header = [
      HeaderKeys.authorization: HeaderKeys.bearer.rawValue + " \(token)",
    ]
    let request = createBaseRequest(url: url,
                                    method: .get,
                                    header: header)
    
    fetch(urlRequest: request) { (result: Result<Profile, NetworkError>) in completion(result) }
  }
  
  func updateProfile(profile: Profile,
                     completion: @escaping (Result<UpdateProfile, NetworkError>) -> Void) {
    let url = URLFactory.Profile.profile
    let parameters: [String : Any] = [
      "name" : profile.name,
      "aboutMyself" : profile.aboutMyself ?? "",
      "topics" : profile.topics.map { topic in
        return topic.id
      }
    ]
    let token = TOKEN ?? ""
    let header = [
      HeaderKeys.authorization: HeaderKeys.bearer.rawValue + " \(token)",
    ]
    let request = createBaseRequest(url: url,
                                    method: .patch,
                                    parameters: parameters,
                                    header: header)
    fetch(urlRequest: request) { (result: Result<UpdateProfile, NetworkError>) in completion(result) }
  }
  
  
  func uploadUserAvatar(avatar: UIImage, completion: @escaping (Result<String, NetworkError>) -> Void) {
    let url = URLFactory.Profile.avatar
    let token = TOKEN ?? ""
    let header = [
      HeaderKeys.authorization: HeaderKeys.bearer.rawValue + " \(token)",
    ]
    let request = createUploadRequest(url: url,
                                      method: .post,
                                      image: avatar,
                                      header: header)
    fetch(urlRequest: request) { (result: Result<String, NetworkError>) in completion(result) }
  }
  
  func deleteUserAvatar(completion: @escaping (Result<String, NetworkError>) -> Void) {
    let url = URLFactory.Profile.avatar
    let token = TOKEN ?? ""
    let header = [
      HeaderKeys.authorization: HeaderKeys.bearer.rawValue + " \(token)",
    ]
    let request = createBaseRequest(url: url,
                                    method: .delete,
                                    header: header)
    fetch(urlRequest: request) { (result: Result<String, NetworkError>) in completion(result) }
  }
}
