//
//  JapanExpenseTrackerApp.swift
//  JapanExpenseTracker
//
//  Created by Aymeric Duchene on 15/03/2026.
//

import SwiftUI

@main
struct JapanExpenseTrackerApp: App {
    @StateObject var manager = ExpenseManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
        }
    }
}
