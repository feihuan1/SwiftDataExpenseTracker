//
//  AddExpenseSheet.swift
//  SwiftDataExpenseTracker
//
//  Created by Feihuan Peng on 3/8/24.
//

import SwiftUI
import SwiftData

struct AddExpenseSheet: View {
    // get access to the model context, all view has access to it
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var date: Date = .now
    @State private var value: Double = 0
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Expense Name", text: $name)
                DatePicker("Date", selection: $date, displayedComponents: .date)
                TextField("value", value: $value, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("New Expense")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Cancel") { dismiss() }
                }                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        // make object
                        let expense = Expense(name: name, date: date, value: value)
                        // insert to context
                        context.insert(expense)
//                        // dont need this since it's auto save
//                        try! context.save() // use do catch in real project
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview{
    AddExpenseSheet()
}
