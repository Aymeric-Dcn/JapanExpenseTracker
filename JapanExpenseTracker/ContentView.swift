//
//  ContentView.swift
//  JapanExpenseTracker
//
//  Created by Aymeric Duchene on 15/03/2026.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                Text("Japan Expense Tracker")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                NavigationLink("Add Expense") {
                    AddExpenseView()
                }
                
                NavigationLink("Add Cash Withdrawal") {
                    Text("Withdrawal Screen")
                }
                
                NavigationLink("See Expenses") {
                    ExpenseListView()
                }
                
                NavigationLink("Statistics") {
                    Text("Stats")
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
