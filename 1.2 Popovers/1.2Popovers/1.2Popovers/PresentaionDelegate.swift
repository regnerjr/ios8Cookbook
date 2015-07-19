import UIKit

class PresentationDelegate: NSObject, UIAdaptivePresentationControllerDelegate {

    /// Use this function to change how the popover is presented when adapting. 
    /// Return none to show popovers when in compact Environments
//    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
//        return UIModalPresentationStyle.None
//
//    }

    /// Present popover embeded in a Navigation Controller when we are in a compact environment
    /// In a Regular environment this is shown as a popover
    func presentationController(controller: UIPresentationController,
        viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewControllerWithIdentifier("NavPopover") as! UINavigationController
    }
}
