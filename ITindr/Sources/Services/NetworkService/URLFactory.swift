import Foundation

struct URLFactory {
  enum ApiVersion: String {
    case v1
  }
  
  private static func makeBaseURLString(apiVersion: ApiVersion = .v1) -> String {
    return "http://193.38.50.175/itindr/api/mobile/\(apiVersion.rawValue)"
  }
  
  // MARK: - Authentication
  struct Authentication {
    private static let base = makeBaseURLString() + "/auth"
    static let login = base + "/login"
    static let register = base + "/register"
    static let logout = base + "/logout"
    static let refresh = base + "/refresh"
  }
  
  // MARK: - Profile
  struct Profile {
    private static let base = makeBaseURLString() + "/profile"
    static let profile = base
    static let avatar = base + "/avatar"
  }
  
  // MARK: - Topic
  struct Topic {
    static let topic = makeBaseURLString() + "/topic"
  }
  
  // MARK: - User
  struct User {
    private static let base = makeBaseURLString() + "/user"
    static let user = base
    static let feed = base + "/feed"
    static func like(userID: String) -> String {
      return base + "/\(userID)/like"
    }
    static func dislike(userID: String) -> String {
      return base + "/\(userID)/dislike"
    }
  }
  
  // MARK: - Chat
  struct Chat {
    private static let base = makeBaseURLString() + "/chat"
    static let chat = base
    static func message(chatID: String) -> String {
      return base + "/\(chatID)/message"
    }
  }
  
}
