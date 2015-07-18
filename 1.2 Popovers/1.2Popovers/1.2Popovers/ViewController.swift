import UIKit

extension Array {
    subscript(path: NSIndexPath) -> Element {
        return self[path.row]
    }
}

extension NSIndexPath {
    class func firstIndexPath() -> NSIndexPath {
        return NSIndexPath(forRow: 0, inSection: 0)
    }
}


class ViewController: UIViewController {

    @IBOutlet weak var selectedItemLabel: UILabel!

    lazy var popover: PopoverTableViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let popover = storyboard.instantiateViewControllerWithIdentifier("PopoverTableView") as! PopoverTableViewController
        popover.selectionHandler = self.selectionHandler
        return popover
    }()

    let popoverDelegate = PresentationDelegate()

    var selectedItem: String?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func selectionHandler(selectedItem: String) -> Void!{
        self.selectedItem = selectedItem
        selectedItemLabel.text = selectedItem
        return Void()
    }

    @IBAction func displayPopover(sender: UIBarButtonItem) {
        popover.modalPresentationStyle = UIModalPresentationStyle.Popover
        let popPC = popover.popoverPresentationController
        popPC?.barButtonItem = sender
        popPC?.permittedArrowDirections = UIPopoverArrowDirection.Any
        popover.presentationController?.delegate = popoverDelegate
        presentViewController(popover, animated: true, completion: nil)

    }
}

