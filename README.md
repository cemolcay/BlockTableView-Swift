BlockTableView-Swift
====================

single line UITableView creation in Swift with power of the closures  

Installation
------------

#### Manual

Copy & paste `BlockTableView.swift` into your project. <br>

#### CocoaPods

        pod "BlockTableView", "~> 0.1"
        
Usage
-----

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

    convenience init(frame: CGRect,
        numberOfRowsInSection   : (section: Int) -> Int,
        cellForRowAtIndexPath   : (tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell,
        didSelectRowAtIndexPath : (tableView: UITableView, indexPath: NSIndexPath) -> ())

    convenience init(frame: CGRect,
        numberOfSections        : Int,
        titleForHeaderInSection : (section: Int) -> String,
        numberOfRowsInSection   : (section: Int) -> Int,
        cellForRowAtIndexPath   : (tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell,
        didSelectRowAtIndexPath : (tableView: UITableView, indexPath: NSIndexPath) -> ())
        
    convenience init(frame: CGRect,
        registeredCells         : [String: AnyClass],
        numberOfRowsInSection   : (section: Int) -> Int,
        cellForRowAtIndexPath   : (tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell,
        didSelectRowAtIndexPath : (tableView: UITableView, indexPath: NSIndexPath) -> ())

    init(frame: CGRect,
        registeredCells         : [String: AnyClass]?,
        numberOfSections        : Int?,
        titleForHeaderInSection : ((section: Int) -> String)?,
        numberOfRowsInSection   : (section: Int) -> Int,
        cellForRowAtIndexPath   : (tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell,
        didSelectRowAtIndexPath : (tableView: UITableView, indexPath: NSIndexPath) -> ())


* You can easily add more initilizers with more `UITableViewDelegate`/`UITableViewDataSource` methods


Search Bar
----------

Search bar implementation never been easier

    func addSearchBar (searchResultTableView tableView: BlockTableView,  didSearch: (String)->())
    
Just create another `BlockTableView` for displaying results and implement the filtering or searching function in didSearch, like

        var filtered: [String]! // search result dataSource
        
        table.addSearchBar(searchResultTableView:
            BlockTableView (frame: self.view.frame,
                numberOfRowsInSection: { (section) -> Int in
                    return filtered.count
                },
                cellForRowAtIndexPath: { (tableView, indexPath) -> UITableViewCell in
                    var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
                    cell.textLabel?.text = filtered[indexPath.row]
                    return cell
                },
                didSelectRowAtIndexPath: { (tableView, indexPath) -> () in
                    return
                }
            ), didSearch: { searchText in
                filtered = filter (dataSource) { $0.rangeOfString(searchText) != nil }
            }
        )

