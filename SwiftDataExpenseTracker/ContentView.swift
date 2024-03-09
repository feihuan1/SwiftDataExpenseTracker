//
//  ContentView.swift
//  SwiftDataExpenseTracker
//
//  Created by Feihuan Peng on 3/8/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    //access to the context, this is the function set to modify data
    @Environment(\.modelContext) var context
    @State private var isShowingItemSheet = false
    // fetch the data , and it will refetch again when delete, this is the actual data
    @Query(sort: \Expense.date) var expenses: [Expense]
    @Query(filter: #Predicate<Expense> { $0.value > 100 } ,sort: \Expense.date) var bigExpense: [Expense] // filter out cheap ones
    
    // this exist when tapGesture happens
    @State private var expenseToEdit: Expense?
    
    var body: some View {
        NavigationStack {
            List {
                // loop whatever you want
                ForEach(bigExpense) { expense in
                    ExpenseCell(expense: expense)
                    // when tap, the same expense is assigned to expenseToEdit then pass the the edit view
                        .onTapGesture {
                            expenseToEdit = expense
                        }
                }
                .onDelete{ indexSet in
                    for index in indexSet {
                        context.delete(expenses[index])
                    }
                }
            }
            .navigationTitle("Expenses")
            .sheet(isPresented: $isShowingItemSheet){ AddExpenseSheet() }
            // expenseToedit is null untill cell in Tapped
            .sheet(item: $expenseToEdit) { expense in
                UpdateExpenseSheet(expense: expense)
            }
            .toolbar{
                if !expenses.isEmpty {
                    Button("Add Expense", systemImage: "plus") {
                        isShowingItemSheet = true
                    }
                }
            }
            .overlay{
                if expenses.isEmpty {
                    // IOS 17 default empty state
                    ContentUnavailableView (label: {
                        Label("No Expenses", systemImage: "list.bullet.rectangle.portrait")
                    }, description: {
                        Text("Starting adding expenses to see your list")
                    }, actions: {
                        Button("Add Expense") {isShowingItemSheet = true}
                    })
                    .offset(y: -60)
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}
