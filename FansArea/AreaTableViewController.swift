//
//  AreaTableViewController.swift
//  FansArea
//
//  Created by Weilong Zhao on 24/4/17.
//  Copyright © 2017 Weilong Zhao. All rights reserved.
//

import UIKit

class AreaTableViewController: UITableViewController {
    /*
    var areas = [
    "area0", "area1", "area2","area3","area4","area5","area6","area7","area8","area9","area10"]
    
    var provinces = [
    "province0", "province1", "province2", "province3", "province4", "province5", "province6", "province7", "province8", "province9", "province10"]
    
    var places = [
    "place0", "place1", "place2", "place3", "place4", "place5", "place6", "place7", "place8", "place9", "place10"]
    
    var areaImages = [
    "xinzhuang", "qilihe", "youxi", "chengxi", "baiyun", "shangjie", "nangang", "yaodu", "wuhou", "jinping", "furong"]

    var visited = [Bool](repeatElement(false, count: 11))
 */
    
    var areas = [Area(name: "Clementi Ave 3 Blk 462", province: "Singapore", part: "Singapore", image: "xinzhuang", isVisited: false),
    Area(name: "Clementi Ave 3 Blk 461", province: "province1", part: "place1", image: "qilihe", isVisited: false),
    Area(name: "Clementi Mrt Station", province: "province2", part: "place2", image: "youxi", isVisited: false),
    Area(name: "Kent Ridge Mrt Station", province: "province3", part: "place3", image: "chengxi", isVisited: false),
    Area(name: "Commonwealth Mrt Station", province: "province4", part: "place4", image: "baiyun", isVisited: false),
    Area(name: "One North Mrt Station", province: "province5", part: "place5", image: "shangjie", isVisited: false),
    Area(name: "area6666666666", province: "province6", part: "place6", image: "nangang", isVisited: false),
    Area(name: "area777", province: "province7", part: "place7", image: "yaodu", isVisited: false),
    Area(name: "area8888888888888888888888888", province: "province8", part: "place8", image: "wuhou", isVisited: false),
    Area(name: "area999999999999999", province: "province9", part: "place9", image: "jinping", isVisited: false),
    Area(name: "area10", province: "province10", part: "place10", image: "furong", isVisited: false)]
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barStyle = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -Table view delegate
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let actionShare = UITableViewRowAction(style: .default, title: "Share") { (_, indexPath) in
            let actionSheet = UIAlertController(title: "Share", message: nil, preferredStyle: .actionSheet)
            let option1 = UIAlertAction(title: "QQ", style: .default, handler: nil)
            let option2 = UIAlertAction(title: "Wechat", style: .default, handler: nil)
            let option3 = UIAlertAction(title: "Cancel", style: .cancel) {(_) in
               self.tableView.setEditing(false, animated: true)
            }
            
            actionSheet.addAction(option1)
            actionSheet.addAction(option2)
            actionSheet.addAction(option3)
            
            self.present(actionSheet, animated: true, completion: nil)
        }
        actionShare.backgroundColor = UIColor.orange
       
        let actionDelete = UITableViewRowAction(style: .destructive, title: "Delete") { (_, indexPath) in
            // Delete the row from the data source
            
            self.areas.remove(at: indexPath.row)
            /*
            self.areaImages.remove(at: indexPath.row)
            self.provinces.remove(at: indexPath.row)
            self.places.remove(at: indexPath.row)
            self.visited.remove(at: indexPath.row)
            */
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            //tableView.reloadData()
        }
        
        return [actionShare, actionDelete]
    }
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let menu = UIAlertController(title:"Hello", message:"you select row number \(indexPath.row)", preferredStyle:.alert)
        //let option1 = UIAlertAction(title: "OK", style:.default, handler: nil)
        //let option2 = UIAlertAction(title: "Cancel", style:.cancel, handler: nil)
        //menu.addAction(option1)
        //menu.addAction(option2)
        //self.present(menu, animated: true, completion: nil)
        
        let menu2 = UIAlertController(title: "Hello", message: "you select row number \(indexPath.row)", preferredStyle: .actionSheet)
        let option21 = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let option22 = UIAlertAction(title: "I have been traveled", style: .default) { (_) in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            self.visited[indexPath.row] = true
            tableView.deselectRow(at: indexPath, animated: true)
        }
        menu2.addAction(option21)
        menu2.addAction(option22)
        self.present(menu2, animated: true, completion: nil)
    }
 */

    // MARK: - Table view data source
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return areas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)as!CustomTableViewCell

        // Configure the cell...
        cell.nameLabel.text = areas[indexPath.row].name
        cell.provinceLabel.text = areas[indexPath.row].province
        cell.placeLabel.text = areas[indexPath.row].part
        cell.thumbImageView.image = UIImage(named :areas[indexPath.row].image)
        cell.thumbImageView.layer.cornerRadius = cell.thumbImageView.frame.size.height/2
        cell.thumbImageView.clipsToBounds = true
        //if self.visited[indexPath.row] {
        //   cell.accessoryType = .checkmark
        //}
        //else {
        //    cell.accessoryType = .none
        //}

        cell.accessoryType = self.areas[indexPath.row].isVisited ? .checkmark : .none
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
            
            self.areas.remove(at: indexPath.row)
            self.areaImages.remove(at: indexPath.row)
            self.provinces.remove(at: indexPath.row)
            self.places.remove(at: indexPath.row)
            self.visited.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            //tableView.reloadData()
            
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
    
    @IBAction func close (segue: UIStoryboardSegue) {
        
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showAreaDetail"{
            let dest = segue.destination as! DetailTableViewController
            dest.area = areas[tableView.indexPathForSelectedRow!.row]
            dest.index = tableView.indexPathForSelectedRow!.row
        }
    }

}
