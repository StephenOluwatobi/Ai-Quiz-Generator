import Cocoa
import FlutterMacOS

// Creates the macOS window that displays Flutter's content.
class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    // Makes the app's Flutter plugins available in this window.
    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
