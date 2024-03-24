//
//  Item.swift
//  Data Practice
//
//  Created by Eusebio Taba on 3/24/24.
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
