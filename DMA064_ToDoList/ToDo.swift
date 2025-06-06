//
//  ToDo.swift
//  DMA064_ToDoList
//
//  Created by Dana Runge on 5/23/25.
//

import Foundation

struct ToDo: Codable {
    var text: String
    var isCompleted: Bool
    var isIgnored: Bool
    var dueDate: Date
    var notes: String?
    var title: String {
        return text
    }
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("ToDos.plist")
    
    
    static func loadToDos() -> [ToDo]? {
        guard let codedToDos = try? Data(contentsOf: ArchiveURL) else {
            return loadSampleToDos()
        }
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode([ToDo].self, from: codedToDos)
    }
    
    static func saveToDos(_ toDos: [ToDo]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try! propertyListEncoder.encode(toDos)
        try! codedToDos.write(to: ArchiveURL, options: .noFileProtection)
    }
    
    static func loadSampleToDos() -> [ToDo] {
        let todo1 = ToDo(text: "Buy milk", isCompleted: false, isIgnored: false, dueDate: Date(), notes: "")
        let todo2 = ToDo(text: "Learn SwiftUI", isCompleted: true, isIgnored: false, dueDate: Date(timeIntervalSinceNow: 3600), notes: "")
        let todo3 = ToDo(text: "Go for a walk", isCompleted: false, isIgnored: true, dueDate: Date(timeIntervalSinceNow: 3600), notes: "")
        return [todo1, todo2, todo3]
    }
    
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
}
