//
//  WeeklyExoenseView.swift
//  JapanExpenseTracker
//
//  Created by Aymeric Duchene on 15/03/2026.
//

import SwiftUI

struct WeeklyExpensesView: View {
    
    @EnvironmentObject var manager: ExpenseManager
    @State private var selectedWeek = Date()
    @State private var selectedCategory = "All"
    @State private var selectedPaymentMethod = "All"
    @State private var useEuro = false
    
    let paymentMethods = ["All", "Cash", "Card"]
    
    var categories: [String] { ["All"] + manager.categories }
    
    var filteredExpenses: [Expense] {
        var expenses = manager.expenses(forWeekOf: selectedWeek)
        if selectedCategory != "All" { expenses = expenses.filter { $0.category == selectedCategory } }
        if selectedPaymentMethod != "All" { expenses = expenses.filter { $0.paymentMethod == selectedPaymentMethod } }
        return expenses
    }
    
    func formatAmount(_ amount: Double) -> String {
        let value = useEuro ? amount * 0.0062 : amount
        let symbol = useEuro ? "€" : "¥"
        return String(format: "%.2f %@", value, symbol)
    }
    
    var body: some View {
        VStack(spacing: 15) {
            
            // Filtrages
            VStack(spacing: 10) {
                DatePicker("Week", selection: $selectedWeek, displayedComponents: [.date])
                    .datePickerStyle(.compact)
                HStack {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(categories, id: \.self) { Text($0) }
                    }
                    .pickerStyle(.menu)
                    
                    Picker("Payment", selection: $selectedPaymentMethod) {
                        ForEach(paymentMethods, id: \.self) { Text($0) }
                    }
                    .pickerStyle(.menu)
                }
                Toggle("Show in Euro", isOn: $useEuro)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemGray6)))
            
            // Graphique horizontal
            ScrollView(.horizontal) {
                HStack(alignment: .bottom, spacing: 10) {
                    ForEach(filteredExpenses) { expense in
                        VStack {
                            Text(formatAmount(expense.amountYen))
                                .font(.caption2)
                                .rotationEffect(.degrees(-45))
                                .frame(height: 30)
                            Rectangle()
                                .fill(expense.paymentMethod == "Cash" ? Color.red : Color.blue)
                                .frame(width: 25, height: CGFloat(expense.amountYen / 100))
                                .cornerRadius(4)
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            // Liste des dépenses
            List(filteredExpenses) { expense in
                HStack {
                    VStack(alignment: .leading) {
                        Text(expense.category).bold()
                        Text(expense.note).font(.caption).foregroundColor(.gray)
                    }
                    Spacer()
                    Text(formatAmount(expense.amountYen))
                        .foregroundColor(expense.paymentMethod == "Cash" ? .red : .blue)
                }
            }
            
            Text("Total for week: \(formatAmount(filteredExpenses.reduce(0) { $0 + $1.amountYen }))")
                .font(.headline)
                .padding()
        }
        .navigationTitle("Weekly Expenses")
    }
}
