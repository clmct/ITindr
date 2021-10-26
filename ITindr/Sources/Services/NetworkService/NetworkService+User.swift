import Foundation

extension NetworkService {
  func getUserList(completion: @escaping (Result<Profile, NetworkError>) -> Void) {
    let url = URLFactory.User.user
    let token = ""
    let header = [
      HeaderKeys.authorization: HeaderKeys.bearer.rawValue + " \(token)",
    ]
    let request = createBaseRequest(url: url,
                                    method: .get,
                                    header: header)
    
    fetch(urlRequest: request) { (result: Result<Profile, NetworkError>) in completion(result) }
  }
}
