//
//  TableViewController.swift
//  tableview
//
//  Created by Aziza on 23.05.2023.
//

import UIKit

class TableViewController: UITableViewController {
    //чтобы отобразить список нажен массив
    //let array = [1,2,3,4,5]
//    var arrayname = ["Король Лев", "Мулан", "Энканто"]
//    var arraysurname = ["Мультик","Мультик","Мультик"]
//    var arrayimage = ["korol","mulan","enkanto"]
    
    var arrayPerson = [Person(name: "Король Лев", surname: "Мультик", imagename: "korol"),
                       Person(name: "Мулан", surname: "Мультик", imagename: "mulan"),
                       Person(name: "Энканто", surname: "Мультик", imagename: "enkanto")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @IBAction func addPerson(_ sender: Any) {
//        arrayname.append("Аватар")
//        arraysurname.append("Кино")
//        arrayimage.append("avatar")
        arrayPerson.append(Person(name: "newName", surname: "newSurname", imagename: "image"))
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int { //количество секции
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {   //количество строк в разделе
        // #warning Incomplete implementation, return the number of rows
        return arrayPerson.count   // count это считать
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //ячейка для строки в
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let label = cell.viewWithTag(1000) as! UILabel //tag 1го лейбла 1000
        label.text = arrayPerson[indexPath.row].name
        let labelsurname = cell.viewWithTag(1001) as! UILabel
        labelsurname.text = arrayPerson[indexPath.row].surname
        let imageview = cell.viewWithTag(1002) as! UIImageView
        imageview.image = UIImage(named: arrayPerson[indexPath.row].imagename)
        return cell
    }
  
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 89
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! ViewController
        
//        detailVC.name = arrayPerson [indexPath.row].name
//        detailVC.surname = arrayPerson [indexPath.row].surname
//        detailVC.imagename = arrayPerson [indexPath.row].imagename
        detailVC.person = arrayPerson[indexPath.row]

        navigationController?.show(detailVC, sender: self)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

  
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
//            arrayname.remove(at: indexPath.row)
//            arraysurname.remove(at: indexPath.row)
//            arrayimage.remove(at: indexPath.row)
            
            arrayPerson.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
   

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
