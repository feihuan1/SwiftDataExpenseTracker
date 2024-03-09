//
//  SwiftDataExpenseTrackerApp.swift
//  SwiftDataExpenseTracker
//
//  Created by Feihuan Peng on 3/8/24.
//

import SwiftUI
import SwiftData

// swift data has auto save
@main
struct SwiftDataExpenseTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // inject at the root view make all view has access to contextModel
        .modelContainer(for: [Expense.self])// if multiple container, use an array
    }
}
