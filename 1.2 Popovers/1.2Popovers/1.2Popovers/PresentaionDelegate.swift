import UIKit

class PresentationDelegate: NSObject, UIAdaptivePresentationControllerDelegate {

    /// Present popover embeded in a Navigation Controller when we are in a compact environment
    /// In a Regular environment this is shown as a popover
    func presentationController(controller: UIPresentationController,
        viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewControllerWithIdentifier("NavPopover") as! UINavigationController
    }
}
