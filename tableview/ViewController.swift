//
//  ViewController.swift
//  tableview
//
//  Created by Aziza on 23.05.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelSurname: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
//    var name = ""
//    var surname = ""
//    var imagename = ""
    
    var person = Person()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelName.text = person.name
        labelSurname.text = person.surname
        imageView.image = UIImage(named: person.imagename)
        
    }


}

