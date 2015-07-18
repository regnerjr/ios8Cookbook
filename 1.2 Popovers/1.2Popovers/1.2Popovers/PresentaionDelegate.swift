import UIKit

class PresentationDelegate: NSObject, UIAdaptivePresentationControllerDelegate {

    func presentationController(controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewControllerWithIdentifier("NavPopover") as! UINavigationController
    }
}
