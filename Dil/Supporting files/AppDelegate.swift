import UIKit
import CoreData

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy var coreDataStack = CoreDataStack(modelName: "Dil")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        coreDataStack.saveContext()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        coreDataStack.saveContext()
    }
}
