//
//  ToDo.swift
//  DMA064_ToDoList
//
//  Created by Dana Runge on 5/23/25.
//

import Foundation

struct ToDo {
    var text: String
    var isCompleted: Bool
    var isIgnored: Bool
    var dueDate: Date?
    var notes: String?
    
    var title: String {
        return text
    }
    
    static func loadToDos() -> [ToDo]? {
        return nil
    }
    
    static func loadSampleToDos() -> [ToDo] {
        let todo1 = ToDo(text: "Buy milk", isCompleted: false, isIgnored: false, dueDate: Date(), notes: "")
        let todo2 = ToDo(text: "Learn SwiftUI", isCompleted: true, isIgnored: false, dueDate: Date(timeIntervalSinceNow: 3600), notes: "")
        let todo3 = ToDo(text: "Go for a walk", isCompleted: false, isIgnored: true, dueDate: nil, notes: "")
        return [todo1, todo2, todo3]
    }
}
