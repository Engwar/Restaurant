//
//  CategoryTableViewController.swift
//  Restaurant
//
//  Created by Igor Shelginskiy on 12/14/18.
//  Copyright © 2018 Igor Shelginskiy. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    // MARK: - Properties
    let menuController = MenuController()
    var categories = [String]()

    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
       menuController.fetchCategories { categories in
        guard let categories = categories else { return }
        
        self.updateUI(with: categories)
        //TODO: update UI
        }
        

//        MenuController().submitOrder(formenuIDs: [1, 2, 3]) { time in
//            print(#function)
//        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }


    func updateUI(with categories: [String]){
        DispatchQueue.main.async {
            self.categories = categories
            self.tableView.reloadData()
        }
    }
    // MARK: - Table view data source
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCellIdentifier", for: indexPath)
        configure(cell, forItemAt: indexPath)


        return cell
    }
    
    func configure(_ cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        
        cell.textLabel?.text = category.capitalized
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


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "MenuSegue" else { return }
        
        let controller = segue.destination as! MenuTableViewController
        
        let index = tableView.indexPathForSelectedRow!.row
        
        controller.category = categories[index]
    }
}
