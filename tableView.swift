//
//  tableViewTableViewController.swift
//  Lesson 3
//
//  Created by Ori Cohen on 4/12/17.
//  Copyright © 2017 Ori Cohen. All rights reserved.
//

import UIKit

class tableView: UITableViewController {

    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats and Deli", "Waffle & Wolf", "Fives Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen", "Straits"]
    
    var pictures = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "caskpubkitchen.jpg", "straits.jpg"]
    
    var location = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London","London", "United Kingdom", "California"]
    
    var type = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Casual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea Shop", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai", "Singaporean Cuisine"]
    
    var restaurantsVisited = Array(repeating: false, count: 22)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }

//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let optionMenu = UIAlertController(title: nil, message:"What Do You Want To Do?", preferredStyle:.actionSheet)
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//      
//        let callActionHandler = {(action:UIAlertAction!)-> Void in
//        let alertMessage = UIAlertController(title: "Service Unavailable", message:"Sorry! The call feature is not available yet. Please try again later.", preferredStyle:.alert)
//            alertMessage.addAction(UIAlertAction(title:"Okay", style: .default,handler: nil))
//            self.present(alertMessage, animated: true, completion: nil)
//        }
//        
//        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
//        optionMenu.addAction(callAction)
//        optionMenu.addAction(cancelAction)
//        
//        let checkInAction = UIAlertAction(title: "Check In", style: .default, handler: { (action:UIAlertAction!) -> Void in
//            let cell = tableView.cellForRow(at: indexPath)
//            cell?.accessoryType = .checkmark
//            self.restaurantsVisited[indexPath.row] = true
//            if self.restaurantsVisited[indexPath.row]{
//                cell?.accessoryType = .checkmark
//            } else {
//                cell?.accessoryType = .none
//            }
//        })
//        optionMenu.addAction(checkInAction)
//        present(optionMenu, animated: true, completion: nil)
//    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RestaurantTableViewCell
        
        // Configure the cell...
        let i = indexPath.row
        cell.nameLabel?.text=restaurantNames[i]
        cell.locationLabel?.text=location[i]
        cell.typeLabel?.text=type[i]
        cell.thumbnail?.image = UIImage(named: pictures[i])
        cell.thumbnail.layer.cornerRadius = 30.0
        cell.thumbnail.clipsToBounds = true
        return cell
    }
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            restaurantNames.remove(at: indexPath.row)
//            pictures.remove(at: indexPath.row)
//            location.remov
//    (at: indexPath.row)
//            type.remove(at: indexPath.row)
//            restaurantsVisited.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share", handler: { (action, indexPath)-> Void in
            let defaultText = "Just Checking In At" + self.restaurantNames[indexPath.row]
            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
        })
         let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete", handler: { (action, indexPath)-> Void in
            self.restaurantNames.remove(at: indexPath.row)
            self.pictures.remove(at: indexPath.row)
            self.location.remove(at: indexPath.row)
            self.type.remove(at: indexPath.row)
            self.restaurantsVisited.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        })
        shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 202.0/255.0, alpha: 1.0)
        return [deleteAction, shareAction]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail"
        {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! DetailViewController
                destinationController.restaurantImage = pictures[indexPath.row]
                destinationController.restaurantName = restaurantNames[indexPath.row]
                destinationController.restaurantType = type[indexPath.row]
                destinationController.restaurantLocation = location[indexPath.row]
            }
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
