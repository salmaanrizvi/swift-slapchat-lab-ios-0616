//
//  AddMessageViewController.swift
//  SlapChat
//
//  Created by Salmaan Rizvi on 7/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class AddMessageViewController: UIViewController {

    @IBOutlet var messageTextField: UITextField!
    let dataStore = DataStore.sharedDataStore
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveTapped(sender: UIButton) {
        
        if let entityDescription = NSEntityDescription.entityForName(Message.entityName, inManagedObjectContext: self.dataStore.managedObjectContext) {
        
            let newMessage = Message(entity: entityDescription, insertIntoManagedObjectContext: dataStore.managedObjectContext)
            
            newMessage.content = self.messageTextField?.text
            newMessage.createdAt = NSDate(timeIntervalSinceNow: 0.0)
        }
        
        self.dataStore.saveContext()
        self.dismissViewControllerAnimated(true) { }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
