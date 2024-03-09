//
//  Expense.swift
//  SwiftDataExpenseTracker
//
//  Created by Feihuan Peng on 3/8/24.
//

import Foundation
import SwiftData

@Model// this macro will make the class a swiftData model
class Expense {
    var name: String
    var date: Date
    var value: Double
    
    init(name: String, date: Date, value: Double) {
        self.name = name
        self.date = date
        self.value = value
    }
}
