//
//  BlockTableView.swift
//  BlockTableView-Swift
//
//  Created by Cem Olcay on 12/11/14.
//  Copyright (c) 2014 Cem Olcay. All rights reserved.
//

import UIKit

class BlockTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    
    // MARK: Init
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    convenience init(frame: CGRect,
        numberOfRowsInSection   : (section: Int) -> Int,
        cellForRowAtIndexPath   : (tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell,
        didSelectRowAtIndexPath : (tableView: UITableView, indexPath: NSIndexPath) -> ()) {
        
        self.init (frame: frame,
            registeredCells: ["Cell": UITableViewCell.self],
            numberOfSections: 1,
            titleForHeaderInSection: nil,
            numberOfRowsInSection: numberOfRowsInSection,
            cellForRowAtIndexPath: cellForRowAtIndexPath,
            didSelectRowAtIndexPath: didSelectRowAtIndexPath)
    }
    
    
    convenience init(frame: CGRect,
        numberOfSections        : Int,
        titleForHeaderInSection : (section: Int) -> String,
        numberOfRowsInSection   : (section: Int) -> Int,
        cellForRowAtIndexPath   : (tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell,
        didSelectRowAtIndexPath : (tableView: UITableView, indexPath: NSIndexPath) -> ()) {
            
        self.init (frame: frame,
            registeredCells: ["Cell": UITableViewCell.self],
            numberOfSections: numberOfSections,
            titleForHeaderInSection: titleForHeaderInSection,
            numberOfRowsInSection: numberOfRowsInSection,
            cellForRowAtIndexPath: cellForRowAtIndexPath,
            didSelectRowAtIndexPath: didSelectRowAtIndexPath)
    }
    
    
    convenience init(frame: CGRect,
        registeredCells         : [String: AnyClass],
        numberOfRowsInSection   : (section: Int) -> Int,
        cellForRowAtIndexPath   : (tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell,
        didSelectRowAtIndexPath : (tableView: UITableView, indexPath: NSIndexPath) -> ()) {
        
        self.init (frame: frame,
            registeredCells: registeredCells,
            numberOfSections: 1,
            titleForHeaderInSection: nil,
            numberOfRowsInSection: numberOfRowsInSection,
            cellForRowAtIndexPath: cellForRowAtIndexPath,
            didSelectRowAtIndexPath: didSelectRowAtIndexPath)
    }
    
    
    init(frame: CGRect,
        registeredCells         : [String: AnyClass]?,
        numberOfSections        : Int?,
        titleForHeaderInSection : ((section: Int) -> String)?,
        numberOfRowsInSection   : ((section: Int) -> Int)?,
        cellForRowAtIndexPath   : ((tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell)?,
        didSelectRowAtIndexPath : ((tableView: UITableView, indexPath: NSIndexPath) -> ())?) {

        self.registeredCells = registeredCells
        self.numberOfSections = numberOfSections
        self.numberOfRowsInSection = numberOfRowsInSection
        self.titleForHeaderInSection = titleForHeaderInSection
        self.cellForRowAtIndexPath = cellForRowAtIndexPath
        self.didSelectRowAtIndexPath = didSelectRowAtIndexPath

        super.init(frame: frame, style: UITableViewStyle.Plain)
        dataSource = self
        delegate = self

        for (key, value) in registeredCells! {
            registerClass(value, forCellReuseIdentifier: key)
        }
    }
        
    

    // MARK: Block

    var registeredCells         : [String: AnyClass]?
    var numberOfSections        : Int?
    var titleForHeaderInSection : ((Int)->String)?
    var numberOfRowsInSection   : ((Int)->Int)?
    var cellForRowAtIndexPath   : ((UITableView, NSIndexPath)->UITableViewCell)?
    var didSelectRowAtIndexPath : ((UITableView, NSIndexPath)->())?

    
    
    // MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return numberOfSections!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowsInSection! (section)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return cellForRowAtIndexPath! (tableView, indexPath)
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let title = titleForHeaderInSection? (section) {
            return title
        }
        else {
            return ""
        }
    }
    
    
    
    // MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        didSelectRowAtIndexPath! (tableView, indexPath)
    }
}
