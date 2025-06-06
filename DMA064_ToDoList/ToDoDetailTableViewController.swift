//
//  ToDoTableViewController.swift
//  DMA064_ToDoList
//
//  Created by Dana Runge on 5/23/25.
//

import UIKit

class ToDoDetailTableViewController: UITableViewController {
    
    var todo: ToDo?
    var isPickerHidden = true
    
    let dateLabelIndexPath = IndexPath(row: 0, section: 1)
    let datePickerIndexPath = IndexPath(row: 0, section: 1)
    let notesTextViewIndexPath = IndexPath(row: 0, section: 3)
    
    let normalCellHeight: CGFloat = 44
    let largeCellHeight: CGFloat = 200

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var isCompleteButton: UIButton!
    @IBOutlet var dueDateTitle: UILabel!
    @IBOutlet var dueDateDetail: UILabel!
    @IBOutlet var dueDatePickerView: UIDatePicker!
    @IBOutlet var dueDateIgnored: UIButton!
    @IBOutlet var notesTextView: UITextView!
    @IBOutlet var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let todo = todo {
            print("data found")
            navigationItem.title = "Edit a todo to ignore"
            titleTextField.text = todo.title
            isCompleteButton.isSelected = todo.isCompleted
            dueDatePickerView.date = todo.dueDate
            notesTextView.text = todo.notes
            dueDateIgnored.isSelected = todo.isIgnored
        } else {
            print("new record")
            dueDatePickerView.date = Date().addingTimeInterval(24*60*60)
        }
        updateDueDateLabel(date: dueDatePickerView.date)
        updateSaveButtonState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else { return }
        
        let title = titleTextField.text!
        let isComplete = isCompleteButton.isSelected
        let dueDateIgnored = dueDateIgnored.isSelected
        let dueDate = dueDatePickerView.date
        let notes = notesTextView.text
        
        todo = ToDo(
            text: title,
            isCompleted: isComplete,
            isIgnored: dueDateIgnored,
            dueDate: dueDate,
            notes: notes
        )
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    func updateSaveButtonState() {
        saveButton.isEnabled = !titleTextField.text!.isEmpty
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        titleTextField.resignFirstResponder()
    }
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompleteButton.isSelected.toggle()
    }
    
    @IBAction func isIgnoredButtonTapped(_ sender: UIButton) {
        dueDateIgnored.isSelected.toggle()
    }
    
    func updateDueDateLabel(date: Date) {
        dueDateDetail.text = ToDo.dueDateFormatter.string(from: date)
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: dueDatePickerView.date)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case datePickerIndexPath:
            return isPickerHidden ? 0 : dueDatePickerView.frame.height
        case notesTextViewIndexPath:
            return largeCellHeight
        default:
            return normalCellHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == datePickerIndexPath {
            isPickerHidden.toggle()
            dueDateDetail.textColor = isPickerHidden ? .black : tableView.tintColor
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
}
