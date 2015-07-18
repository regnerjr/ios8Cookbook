import UIKit

class PopoverTableViewController: UITableViewController {

    struct TableViewValues {
        static let identifier = "Cell"
    }

    // Data to display in our popover table
    lazy var items: [String] = {
        return Array(1...100).map{"Item \($0)"}
    }()

    @IBOutlet weak var cancelButton: UIBarButtonItem!

    var selectionHandler: ((selectedItem: String) -> Void)?

    @IBAction func performCancel(){
        dismissViewControllerAnimated(true, completion: nil)
    }

    //MARK: - TableView Delegate/DataSource
    override func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            TableViewValues.identifier, forIndexPath: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }

    override func tableView(tableView: UITableView,
        didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedItem = items[indexPath.row]
        selectionHandler?(selectedItem: selectedItem)
        dismissViewControllerAnimated(true, completion: nil)
    }
}
