import Cocoa
import FlutterMacOS

// Starts the macOS app and handles its basic window behaviour.
@main
class AppDelegate: FlutterAppDelegate {
  // Closes the app when its final window is closed.
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }

  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }
}
