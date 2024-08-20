//
//  Item.swift
//  ToDo App
//
//  Created by German David Vertel Narvaez on 19/08/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
