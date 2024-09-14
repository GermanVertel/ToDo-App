//
//  Task.swift
//  ToDo App
//
//  Created by German David Vertel Narvaez on 19/08/24.
//

import Foundation
import SwiftUI

enum Priority: Int {
    case low = 1
    case normal = 2
    case hight = 3
    
    func toString() -> String {
        switch self {
        case .low:
            return "Baja"
        case .normal:
            return "Normal"
        case .hight:
            return "Alta "
        }
    }
    
    
    func color() -> Color{
        switch self {
        case .low:
            return .green
        case .normal:
            return .yellow
        case .hight:
            return .red
        }
    }
    
}

@Observable class Task: Identifiable{
    var id : UUID
    var title: String
    var priority: Priority
    var isCompleted : Bool
    
    init(id: UUID = UUID(), title: String = "", priority: Priority = .normal, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.priority = priority
        self.isCompleted = isCompleted
    }
}
