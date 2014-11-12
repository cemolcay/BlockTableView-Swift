BlockTableView-Swift
====================

single line UITableView creation in Swift with power of the closures


Usage
-----

Copy & paste BlockTableView.swift into your project. <br>

        let table = BlockTableView (frame: self.view.frame,
            numberOfRowsInSection: { (section) -> Int in
                return dataSource.count
            },
            cellForRowAtIndexPath: { (tableView, indexPath) -> UITableViewCell in
                var cell = UITableViewCell (style: .Default, reuseIdentifier: "Identifer")
                
                let current = dataSource[indexPath.row]
                cell.textLabel.text = current
                
                return cell
            },
            didSelectRowAtIndexPath: { (tableView, indexPath) -> () in
                let selected = dataSource[indexPath.row]
                println("\(selected) selected")
                
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
            }
        )


Initilizers
--------------

    init(frame: CGRect,
        numberOfRowsInSection: (section: Int) -> Int,
        cellForRowAtIndexPath: (tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell,
        didSelectRowAtIndexPath: (tableView: UITableView, indexPath: NSIndexPath) -> ())

    init(frame: CGRect,
        numberOfSections: Int,
        numberOfRowsInSection: (section: Int) -> Int,
        titleForHeaderInSection : (section: Int) -> String,
        cellForRowAtIndexPath: (tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell,
        didSelectRowAtIndexPath: (tableView: UITableView, indexPath: NSIndexPath) -> ())
        
    init(frame: CGRect,
        numberOfSections: Int,
        numberOfRowsInSection: (section: Int) -> Int,
        cellForRowAtIndexPath: (tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell,
        didSelectRowAtIndexPath: (tableView: UITableView, indexPath: NSIndexPath) -> (),
        heightForCellAtIndexPath: (indexPath: NSIndexPath)->CGFloat)

    init(frame: CGRect,
        numberOfSections: Int,
        numberOfRowsInSection: (section: Int) -> Int,
        titleForHeaderInSection: (section: Int) -> String,
        cellForRowAtIndexPath: (tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell,
        didSelectRowAtIndexPath: (tableView: UITableView, indexPath: NSIndexPath) -> (),
        heightForCellAtIndexPath: (indexPath: NSIndexPath)->CGFloat)


* You can easily add more initilizers with more UITableViewDelegate/UITableViewDataSource methods
