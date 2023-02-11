//
//  AddDetailsViewController.swift
//  Lidavi_Assignment
//
//  Created by Viswanath on 10/02/23.
//

import UIKit

class AddDetailsViewController: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var termsandconditionsLbl: UILabel!
    @IBOutlet weak var btnCheckBox: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    
    var unChecked = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveBtn.layer.cornerRadius = 10
    }
    
    @IBAction func onClickAdd(_ sender: Any) {
        if let name = nameTF.text, let email = emailTF.text{
            let allDetails = Details(context: DBManager.share.persistentContainer.viewContext)
            allDetails.name = name
            allDetails.email = email
            if unChecked == false{
                DBManager.share.saveContext()
                navigationController?.popViewController(animated: true)
            }
            
        }
        
    }
    
    @IBAction func btnCheckMarkTapped(_ sender: UIButton) {
        let checkedImage = UIImage(named: "Checkmark")! as UIImage
        let uncheckedImage = UIImage(named: "Checkmarkempty")! as UIImage
        
        if unChecked {
            (sender as AnyObject).setImage(checkedImage, for: UIControl.State.normal)
            unChecked = false
        }
        else {
            (sender as AnyObject).setImage(uncheckedImage, for: UIControl.State.normal)
            unChecked = true
        }
        
    }
}

