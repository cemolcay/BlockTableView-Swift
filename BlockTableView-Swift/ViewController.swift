//
//  ViewController.swift
//  BlockTableView-Swift
//
//  Created by Cem Olcay on 12/11/14.
//  Copyright (c) 2014 Cem Olcay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        createSingleSectionTableView()
        createMultiSectionTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func createSingleSectionTableView () {
        
        // Setup data source
        var dataSource : [String] = []
        for i in 1...20 {
            dataSource.append("cell \(i)")
        }
        
        
        // Create BlockTableView
        let table = BlockTableView (frame: self.view.frame,
            registeredCells: ["asd": UITableViewCell.self],
            numberOfRowsInSection: { (section) -> Int in
                return dataSource.count
            },
            cellForRowAtIndexPath: { (tableView, indexPath) -> UITableViewCell in
                var cell = tableView.dequeueReusableCellWithIdentifier("asd", forIndexPath: indexPath) as UITableViewCell
                
                let current = dataSource[indexPath.row]
                cell.textLabel?.text = current
                cell.textLabel?.numberOfLines = 0
                
                return cell
            },
            didSelectRowAtIndexPath: { (tableView, indexPath) -> () in
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                
                let selected = dataSource[indexPath.row]
                println("\(selected) selected")
            }
        )
        
        
        // Add table to view
        self.view.addSubview(table)
    }
    
    func createMultiSectionTableView () {
        
        // Setup data source
        var dataSource : [String:[String]] = [
            "Section 1":["Cell 1", "Cell 2", "Cell 3", "Cell 4"],
            "Section 2":["Cell 1", "Cell 2", "Cell 3", "Cell 4", "Cell 5"],
            "Section 3":["Cell 1", "Cell 2", "Cell 3"]
        ]
        
        // Create BlockTableView
        let table = BlockTableView (frame: self.view.frame,
            numberOfSections: dataSource.count,
            titleForHeaderInSection: { (section) -> String in
                return dataSource.keys.array[section]
            },
            numberOfRowsInSection: { (section) -> Int in
                dataSource.values.array[section].count
            },
            cellForRowAtIndexPath: { (tableView, indexPath) -> UITableViewCell in
                var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
                
                let current = dataSource.values.array[indexPath.section][indexPath.row]
                cell.textLabel?.text = current
                
                return cell
            },
            didSelectRowAtIndexPath: { (tableView, indexPath) -> () in
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                
                let selected = dataSource.values.array[indexPath.section][indexPath.row]
                println("\(selected) selected")
            }
        )
        
        // Add table to view
        self.view.addSubview(table)
    }
}

