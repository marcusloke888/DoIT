//
//  TaskViewController.swift
//  DoIT
//
//  Created by Loke Seng Choe on 31/03/2017.
//  Copyright © 2017 Loke Seng Choe. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Task] = []
    //var selectedTaskIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️\(String(describing: task.name!))"
            
        } else
        {
            cell.textLabel?.text = task.name!
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // selectedTaskIndex = indexPath.row
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    /*
    func makeTasks() -> [Task]{
        let task1 = Task()
        task1.name = "Walk the dog"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Buy cheese"
        task2.important = false
        
        let task3 = Task()
        task3.name = "Maw the lawn"
        task3.important = false
        
        return [task1,task2,task3]
        
    }
 */
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    func getTasks() {
       let ctxt = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
           tasks = try ctxt.fetch(Task.fetchRequest()) as! [Task]
        } catch {
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if segue.identifier == "addSegue" {
          //  let nextVC = segue.destination as! CreateTaskViewController
            //nextVC.previousVC = self
        //}
        
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task
            //nextVC.previousVC = self
        }
        
    }
}

