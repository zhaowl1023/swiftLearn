//
//  DetailTableViewController.swift
//  FansArea
//
//  Created by Weilong Zhao on 30/4/17.
//  Copyright © 2017 Weilong Zhao. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var area : AreaMO!
    var index : Int!
    @IBOutlet weak var ratingBtn: UIButton!
    @IBOutlet weak var LargeImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        LargeImageView.image = UIImage(data: area.image as! Data)
        ratingBtn.setImage(UIImage(named: (area.rating != nil) ? area.rating!:"rating"), for: .normal)
        tableView.backgroundColor = UIColor(white: 0.98, alpha: 1)
        tableView.separatorColor = UIColor(white: 0.9, alpha: 1)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        
        self.title = area.name

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
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
   */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailTableViewCell
        cell.backgroundColor = UIColor.clear
        
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Area"
            cell.valueLabel.text = area.name
        case 1:
            cell.fieldLabel.text = "省"
            cell.valueLabel.text = area.province
        case 2:
            cell.fieldLabel.text = "Part"
            cell.valueLabel.text = area.part
        case 3:
            cell.fieldLabel.text = "Visited or Not"
            cell.valueLabel.text = area.isVisited ? "Yes" : "No"
        default: break
        }

        return cell
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
        // Get the new view controller using segue.destinationViewController.
        if segue.identifier == "showMap" {
            let destVC = segue.destination as! MapViewController
            destVC.area = self.area
        }
        
        // Pass the selected object to the new view controller.
    }
    
    
    @IBAction func close(segue: UIStoryboardSegue){
        let reviewVC = segue.source as! ReviewViewController
        if let rating = reviewVC.rating {
            self.area.rating = rating
            self.ratingBtn.setImage(UIImage(named: rating), for: .normal)
        }
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.saveContext()
    }

}
