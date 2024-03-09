//
//  ExpenseCell.swift
//  SwiftDataExpenseTracker
//
//  Created by Feihuan Peng on 3/8/24.
//

import SwiftUI
import SwiftData

struct ExpenseCell: View {
    let expense: Expense

    var body: some View {
        HStack {
            Text(expense.date, format: .dateTime.month(.abbreviated).day())
                .frame(width: 70, alignment: .leading)
            Text(expense.name)
            Spacer()
            Text(expense.value, format: .currency(code: "USD"))
        }
    }
}

//#Preview {
//    ExpenseCell(expense: Expense)
//}
