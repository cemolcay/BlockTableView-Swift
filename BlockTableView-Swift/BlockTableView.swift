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
    
    init(frame: CGRect,
        numberOfSections: Int,
        numberOfRowsInSection: (section: Int) -> Int,
        cellForRowAtIndexPath: (tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell,
        didSelectRowAtIndexPath: (tableView: UITableView, indexPath: NSIndexPath) -> ()) {
            
            self.numberOfSections = numberOfSections
            self.numberOfRowsInSection = numberOfRowsInSection
            self.cellForRowAtIndexPath = cellForRowAtIndexPath
            self.didSelectRowAtIndexPath = didSelectRowAtIndexPath
            
            super.init(frame: frame, style: UITableViewStyle.Plain)
            dataSource = self
            delegate = self
    }
    
    init(frame: CGRect,
        numberOfSections: Int,
        numberOfRowsInSection: (section: Int) -> Int,
        cellForRowAtIndexPath: (tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell,
        didSelectRowAtIndexPath: (tableView: UITableView, indexPath: NSIndexPath) -> (),
        heightForCellAtIndexPath: (indexPath: NSIndexPath)->CGFloat) {
            
            self.numberOfSections = numberOfSections
            self.numberOfRowsInSection = numberOfRowsInSection
            self.cellForRowAtIndexPath = cellForRowAtIndexPath
            self.didSelectRowAtIndexPath = didSelectRowAtIndexPath
            self.heightForCellAtIndexPath = heightForCellAtIndexPath
            
            super.init(frame: frame, style: UITableViewStyle.Plain)
            dataSource = self
            delegate = self
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    // MARK: Block
    
    var numberOfSections         : Int?
    var numberOfRowsInSection    : ((Int)->Int)?
    var cellForRowAtIndexPath    : ((UITableView, NSIndexPath)->UITableViewCell)?
    var didSelectRowAtIndexPath  : ((UITableView, NSIndexPath)->())?
    var heightForCellAtIndexPath : ((NSIndexPath)->CGFloat)?
    
    
    
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
    
    
    
    // MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        didSelectRowAtIndexPath! (tableView, indexPath)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if let height = heightForCellAtIndexPath? (indexPath) {
            return height
        } else {
            return 44
        }
    }
}
