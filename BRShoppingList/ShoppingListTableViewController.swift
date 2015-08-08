//
//  ShoppingListTableViewController.swift
//  BRShoppingList
//
//  Created by Bobby Ren on 5/12/15.
//  Copyright (c) 2015 Bobby Ren. All rights reserved.
//

import UIKit

class ShoppingListTableViewController: UITableViewController, UIAlertViewDelegate {
    
    var items:NSMutableArray = NSMutableArray()
    var cart:NSMutableArray = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let rightButton = UIBarButtonItem(title: "Add Item", style: UIBarButtonItemStyle.Plain, target: self, action: "addItem")
        self.navigationItem.rightBarButtonItem = rightButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        if section == 0 {
            return self.items.count
        }
        else if section == 1 {
            return self.cart.count
        }
        else {
            return 0;
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "I need:"
        }
        else if section == 1 {
            return "I have:"
        }
        else {
            return ""
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ShoppingListCell", forIndexPath: indexPath) as! ShoppingListCell

        // Configure the cell...
        let section = indexPath.section
        let row = indexPath.row
        if section == 0 {
            let dictionary = self.items[row] as! [NSObject:AnyObject]
            cell.labelName.text = dictionary["name"] as? String
        }
        else if section == 1 {
            let dictionary = self.cart[row] as! [NSObject:AnyObject]
            cell.labelName.text = dictionary["name"] as? String
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let section = indexPath.section
        let row = indexPath.row
        if section == 0 {
            // clicking on the "I need" section means we found that item
            let item = items.objectAtIndex(row) as! NSDictionary
            self.items.removeObjectAtIndex(row)
            self.cart.addObject(item)
        }
        else if section == 1 {
            // clicking on the "I have" section means we put that item back, so we need it again
            let item = cart.objectAtIndex(row) as! NSDictionary
            self.cart.removeObjectAtIndex(row)
            self.items.addObject(item)
        }
        self.tableView.reloadData()
    }
    
    func addItem() {
        var alert = UIAlertView(title: "Enter a new item", message: "", delegate: self, cancelButtonTitle: "cancel", otherButtonTitles: "Add")
        alert.alertViewStyle = UIAlertViewStyle.PlainTextInput
        alert.show()
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 0 {
            // cancel
            println("canceled")
        }
        else {
            // save
            let textfield = alertView.textFieldAtIndex(0)
            let itemName = textfield!.text
            println("saving item \(itemName)")
            
            items.addObject(["name":itemName])
            self.tableView.reloadData()
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
