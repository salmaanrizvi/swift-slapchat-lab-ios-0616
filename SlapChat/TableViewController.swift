//
//  TableViewController.swift
//  SlapChat
//
//  Created by susan lovaglio on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    let dataStore = DataStore.sharedDataStore
    //var localMessages : [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if dataStore.messages.count == 0 {
            generateTestData()
        }
        self.dataStore.fetchData()
        self.tableView.reloadData()
    }
    
    func generateTestData() {
        
        if let entityDescription = NSEntityDescription.entityForName(Message.entityName, inManagedObjectContext: self.dataStore.managedObjectContext) {
            
            let newMessage = Message(entity: entityDescription, insertIntoManagedObjectContext: self.dataStore.managedObjectContext)
            newMessage.content = "First message stored ever!"
            newMessage.createdAt = NSDate(timeIntervalSinceNow: 0.0)
            //localMessages.append(newMessage)
        }
        
        
        if let entityDescription = NSEntityDescription.entityForName(Message.entityName, inManagedObjectContext: self.dataStore.managedObjectContext) {
            
            let secondMessage = Message(entity: entityDescription, insertIntoManagedObjectContext: self.dataStore.managedObjectContext)
            
            secondMessage.content = "Second message ever!!!"
            secondMessage.createdAt = NSDate(timeIntervalSinceNow: 0.0)
            //localMessages.append(secondMessage)
        }
        
        self.dataStore.saveContext()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("basicCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = self.dataStore.messages[indexPath.row].content
        
        let messageDate = self.dataStore.messages[indexPath.row].createdAt
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        dateFormatter.timeStyle = .ShortStyle
        
        cell.detailTextLabel?.text = dateFormatter.stringFromDate(messageDate!)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataStore.messages.count
    }
}
