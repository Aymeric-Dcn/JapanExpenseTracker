//
//  ExpenseManager.swift
//  JapanExpenseTracker
//
//  Created by Aymeric Duchene on 15/03/2026.
//

import Foundation
import Combine

class ExpenseManager: ObservableObject {
    
    @Published var expenses: [Expense] = [] {
        didSet {
            saveExpenses()
        }
    }
    @Published var categories: [String] = []

    func addExpense(expense: Expense) {
        expenses.append(expense)
        if !categories.contains(expense.category) {
            categories.append(expense.category)
        }
    }
    
    @Published var withdrawals: Double = 0
    
    private let savePath: URL = {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("expenses.json")
    }()
    
    init() {
        loadExpenses()
        categories = Array(Set(expenses.map { $0.category}))
    }
    

    
    func addExpense(_ expense: Expense) {
        expenses.append(expense)
        if !categories.contains(expense.category) {
            categories.append(expense.category)
        }
    }
    
    func addWithdrawal(amount: Double) {
        withdrawals += amount
    }
    
    var cashSpent: Double {
        expenses
            .filter { $0.paymentMethod == "Cash" }
            .reduce(0) { $0 + $1.amountYen }
    }
    
    var cashRemaining: Double {
        withdrawals - cashSpent
    }
    
    var totalSpent: Double {
        expenses.reduce(0) { $0 + $1.amountYen }
    }
    
    // MARK: - Save
    
    func saveExpenses() {
        do {
            let data = try JSONEncoder().encode(expenses)
            try data.write(to: savePath)
        } catch {
            print("Savind Error")
        }
    }
    
    // MARK: - Load
    
    func loadExpenses() {
        do {
            let data = try Data(contentsOf: savePath)
            expenses = try JSONDecoder().decode([Expense].self, from: data)
        } catch {
            expenses = []
        }
    }
}
