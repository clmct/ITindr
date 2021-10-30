import Foundation

extension NetworkService {
  func getChatList(completion: @escaping (Result<Chats, NetworkError>) -> Void) {
    // limit
    // offset
    let url = URLFactory.User.user
    let token = TOKEN ?? ""
    let header = [
      HeaderKeys.authorization: HeaderKeys.bearer.rawValue + " \(token)",
    ]
    let request = createBaseRequest(url: url,
                                    method: .get,
                                    header: header)
    
    fetch(urlRequest: request) { (result: Result<Chats, NetworkError>) in completion(result) }
  }
  
  func createChat(completion: @escaping (Result<Chat, NetworkError>) -> Void) {
    let url = URLFactory.User.feed
    let token = TOKEN ?? ""
    let header = [
      HeaderKeys.authorization: HeaderKeys.bearer.rawValue + " \(token)",
    ]
    let request = createBaseRequest(url: url,
                                    method: .get,
                                    header: header)
    
    fetch(urlRequest: request) { (result: Result<Chat, NetworkError>) in completion(result) }
  }
  
  func getMessages(userID: String, completion: @escaping (Result<Messages, NetworkError>) -> Void) {
    let url = URLFactory.User.like(userID: userID)
    let token = TOKEN ?? ""
    let header = [
      HeaderKeys.authorization: HeaderKeys.bearer.rawValue + " \(token)",
    ]
    let request = createBaseRequest(url: url,
                                    method: .post,
                                    header: header)
    
    fetch(urlRequest: request) { (result: Result<Messages, NetworkError>) in completion(result) }
  }
  
  func sendMessage(userID: String, completion: @escaping (Result<Message, NetworkError>) -> Void) {
    let url = URLFactory.User.dislike(userID: userID)
    let token = TOKEN ?? ""
    let header = [
      HeaderKeys.authorization: HeaderKeys.bearer.rawValue + " \(token)",
    ]
    let request = createBaseRequest(url: url,
                                    method: .post,
                                    header: header)
    
    fetch(urlRequest: request) { (result: Result<Message, NetworkError>) in completion(result) }
  }
}
