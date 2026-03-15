//
//  Expense.swift
//  JapanExpenseTracker
//
//  Created by Aymeric Duchene on 15/03/2026.
//

import Foundation

struct Expense: Identifiable, Codable {
    
    var id = UUID()
    var date: Date
    var amountYen: Double
    var paymentMethod: String
    var category: String
    var note: String
    
    var amountEuro: Double {
        return amountYen * 0.0062
    }
}
