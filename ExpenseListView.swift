//
//  ExpenseListView.swift
//  JapanExpenseTracker
//
//  Created by Aymeric Duchene on 15/03/2026.
//

import Foundation
import SwiftUI

struct ExpenseListView: View {
    
    @EnvironmentObject var manager: ExpenseManager
    
    var body: some View {
        
        List(manager.expenses) { expense in
            
            VStack(alignment: .leading) {
                
                Text(expense.category)
                    .font(.headline)
                
                Text("\(expense.amountYen, specifier: "%.0f") ¥")
                
                Text("\(expense.amountEuro, specifier: "%.2f") €")
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("Dépenses")
    }
}
