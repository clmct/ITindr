import Foundation
import os.log

struct Logger {
  static func printLogs(message: String) {
      let log = OSLog(subsystem: "ITindr", category: "Info")
      os_log("Message: %s", log: log, type: .info, message)
  }
}
