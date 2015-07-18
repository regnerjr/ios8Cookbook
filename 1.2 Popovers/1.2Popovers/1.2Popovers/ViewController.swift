import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var selectedItemLabel: UILabel!
    // Popover containing a table of numbers to allow selection, 
    // presentation is somewhat managed by the Presentation Delegate
    lazy var popover: PopoverTableViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let popover = storyboard.instantiateViewControllerWithIdentifier("PopoverTableView") as! PopoverTableViewController
        popover.selectionHandler = self.selectionHandler
        return popover
    }()

    let popoverDelegate = PresentationDelegate()

    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Handle Popover Selection
    func selectionHandler(selectedItem: String){
        selectedItemLabel.text = selectedItem
    }

    // MARK: - Actions
    @IBAction func displayPopover(sender: UIBarButtonItem) {
        popover.modalPresentationStyle = UIModalPresentationStyle.Popover
        let popPC = popover.popoverPresentationController
        popPC?.barButtonItem = sender
        popPC?.permittedArrowDirections = UIPopoverArrowDirection.Any
        popover.presentationController?.delegate = popoverDelegate
        presentViewController(popover, animated: true, completion: nil)

    }
}

