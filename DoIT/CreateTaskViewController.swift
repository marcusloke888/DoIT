//
//  CreateTaskViewController.swift
//  DoIT
//
//  Created by Loke Seng Choe on 01/04/2017.
//  Copyright © 2017 Loke Seng Choe. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
   // var previousVC = TaskViewController()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
        //let task = Task()
        let ctxt = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = Task(context: ctxt)
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
     //   previousVC.tasks.append(task)
     //   previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
   
}
