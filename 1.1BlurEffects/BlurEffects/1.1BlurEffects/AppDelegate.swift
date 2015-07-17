import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        if let _ = NSClassFromString("XCTestCase"){
            //modify env for testing.
            print("TESTING")
        }

        return true
    }

}

