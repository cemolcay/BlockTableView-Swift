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
        
        
        // Setup data source
        var dataSource : [String] = []
        for i in 1...20 {
            dataSource.append("cell \(i)")
        }
        
        
        // Create BlockTableView
        let table = BlockTableView (frame: self.view.frame,
            numberOfSections: 1,
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
        
        
        // Add table to view
        self.view.addSubview(table)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

