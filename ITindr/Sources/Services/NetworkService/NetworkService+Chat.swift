import Foundation

extension NetworkService {
  func getChatList(completion: @escaping (Result<Profile, NetworkError>) -> Void) {
    // limit
    // offset
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
  
  func createChat(completion: @escaping (Result<Profile, NetworkError>) -> Void) {
    let url = URLFactory.User.feed
    let token = ""
    let header = [
      HeaderKeys.authorization: HeaderKeys.bearer.rawValue + " \(token)",
    ]
    let request = createBaseRequest(url: url,
                                    method: .get,
                                    header: header)
    
    fetch(urlRequest: request) { (result: Result<Profile, NetworkError>) in completion(result) }
  }
  
  func getMessages(userID: String, completion: @escaping (Result<Profile, NetworkError>) -> Void) {
    let url = URLFactory.User.like(userID: userID)
    let token = ""
    let header = [
      HeaderKeys.authorization: HeaderKeys.bearer.rawValue + " \(token)",
    ]
    let request = createBaseRequest(url: url,
                                    method: .post,
                                    header: header)
    
    fetch(urlRequest: request) { (result: Result<Profile, NetworkError>) in completion(result) }
  }
  
  func sendMessage(userID: String, completion: @escaping (Result<Profile, NetworkError>) -> Void) {
    let url = URLFactory.User.dislike(userID: userID)
    let token = ""
    let header = [
      HeaderKeys.authorization: HeaderKeys.bearer.rawValue + " \(token)",
    ]
    let request = createBaseRequest(url: url,
                                    method: .post,
                                    header: header)
    
    fetch(urlRequest: request) { (result: Result<Profile, NetworkError>) in completion(result) }
  }
}
