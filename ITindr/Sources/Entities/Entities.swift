import Foundation

var TOKEN: String? {
  get {
    UserDefaults.standard.string(forKey: "TOKEN")
  }
  set {
    UserDefaults.standard.set(newValue, forKey: "TOKEN")
  }
}

var REFRESHTOKEN: String? {
  get {
    UserDefaults.standard.string(forKey: "REFRESHTOKEN")
  }
  set {
    UserDefaults.standard.set(newValue, forKey: "REFRESHTOKEN")
  }
}

typealias Chats = [Chat]
typealias Messages = [Message]
typealias Users = [Profile]
typealias Topics = [Topic]

struct AuthResponse: Codable {
  var accessToken: String
  var refreshToken: String
}

// MARK: - Profile
struct Profile: Codable {
  let userID, name: String
  let aboutMyself: String?
  let avatar: String?
  let topics: [Topic]

  enum CodingKeys: String, CodingKey {
      case userID = "userId"
      case name, aboutMyself, avatar, topics
  }
}

// MARK: - UpdateProfile - local
struct UpdateProfile: Codable {
    let name, aboutMyself: String
    let topics: [String]
}

// MARK: - Topic
struct Topic: Codable {
  let id, title: String
  var isSelect: Bool? = false
}

// MARK: - Chat
struct Chat: Codable {
    let chat: ChatClass
    let lastMessage: Message
}

// MARK: - ChatClass
struct ChatClass: Codable {
    let id, title: String
    let avatar: String?
}

// MARK: - LastMessage
struct Message: Codable {
    let id, text, createdAt: String
    let user: Profile
    let attachments: [String]
}



