import Foundation

extension NetworkService {
  func getUserList(limit: Int,
                   offset: Int,
                   completion: @escaping (Result<Users, NetworkError>) -> Void) {
    let url = URLFactory.User.user
    let token = TOKEN ?? ""
    let header = [
      HeaderKeys.authorization: HeaderKeys.bearer.rawValue + " \(token)",
    ]
    let query = [
      "limit": "\(limit)",
      "offset": "\(offset)",
    ]
    let request = createBaseRequest(url: url,
                                    query: query,
                                    method: .get,
                                    header: header)
    
    fetch(urlRequest: request) { (result: Result<Users, NetworkError>) in completion(result) }
  }
  
  func getInterestingUserList(completion: @escaping (Result<Users, NetworkError>) -> Void) {
    let url = URLFactory.User.feed
    let token = TOKEN ?? ""
    let header = [
      HeaderKeys.authorization: HeaderKeys.bearer.rawValue + " \(token)",
    ]
    let request = createBaseRequest(url: url,
                                    method: .get,
                                    header: header)
    
    fetch(urlRequest: request) { (result: Result<Users, NetworkError>) in completion(result) }
  }
  
  func likeUser(userID: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
    let url = URLFactory.User.like(userID: userID)
    let token = TOKEN ?? ""
    let header = [
      HeaderKeys.authorization: HeaderKeys.bearer.rawValue + " \(token)",
    ]
    let request = createBaseRequest(url: url,
                                    method: .post,
                                    header: header)
    
    fetch(urlRequest: request) { (result: Result<String, NetworkError>) in completion(result) }
  }
  
  func dislikeUser(userID: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
    let url = URLFactory.User.dislike(userID: userID)
    let token = TOKEN ?? ""
    let header = [
      HeaderKeys.authorization: HeaderKeys.bearer.rawValue + " \(token)",
    ]
    let request = createBaseRequest(url: url,
                                    method: .post,
                                    header: header)
    
    fetch(urlRequest: request) { (result: Result<String, NetworkError>) in completion(result) }
  }
}
