//
//  CompleteTaskViewController.swift
//  DoIT
//
//  Created by Loke Seng Choe on 01/04/2017.
//  Copyright © 2017 Loke Seng Choe. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    @IBOutlet weak var taskLabel: UILabel!
    var task = Task()
    var previousVC = TaskViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
      
        if task.important {
            taskLabel.text = "❗️\(task.name)"
            
        } else
        {
            taskLabel.text = task.name
        }
    }

    @IBAction func completeTapped(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedTaskIndex)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
   

}
