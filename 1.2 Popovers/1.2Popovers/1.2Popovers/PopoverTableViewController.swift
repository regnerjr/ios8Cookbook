import UIKit

class PopoverTableViewController: UITableViewController {
    struct TableViewValues {
        static let identifier = "Cell"
    }

    lazy var items: [String] = {
        return Array(1...100).map{"Item \($0)"}
    }()

    @IBOutlet weak var cancelButton: UIBarButtonItem!

    var selectionHandler: ((selectedItem: String)-> Void!)?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: TableViewValues.identifier)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        preferredContentSize = CGSize(width: 300, height: 200)
    }

    @IBAction func performCancel(){
        dismissViewControllerAnimated(true, completion: nil)
    }

    //MARK: - TableView Delegate/DataSource
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedItem = items[indexPath]
        selectionHandler?(selectedItem: selectedItem)
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableViewValues.identifier, forIndexPath: indexPath)
        cell.textLabel?.text = items[indexPath]
        return cell
    }
}
