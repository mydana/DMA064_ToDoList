//
//  ToDoTableViewController.swift
//  DMA064_ToDoList
//
//  Created by Dana Runge on 5/23/25.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    var todos = [ToDo]()
    
    override func viewDidLoad() {
        print("ToDoTableViewController.viewDidLoad()")
        super.viewDidLoad()
        if let saveToDos = ToDo.loadToDos() {
            todos = saveToDos
        } else {
            todos = ToDo.loadSampleToDos()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCellIdentifier", for: indexPath)
        let todo = todos[indexPath.row]
        cell.textLabel?.text = todo.title
        return cell
    }
    
}
