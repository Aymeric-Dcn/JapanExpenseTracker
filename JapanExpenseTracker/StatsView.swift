import SwiftUI

struct StatsView: View {
    
    @EnvironmentObject var manager: ExpenseManager
    @State private var selectedCategory = "All"
    @State private var selectedPaymentMethod = "All"
    @State private var useEuro = false
    
    let paymentMethods = ["All", "Cash", "Card"]
    
    var categories: [String] { ["All"] + manager.categories }
    
    func formatAmount(_ amount: Double) -> String {
        let value = useEuro ? amount * 0.0062 : amount
        let symbol = useEuro ? "€" : "¥"
        return String(format: "%.2f %@", value, symbol)
    }
    
    func filterExpenses(_ expenses: [Expense]) -> [Expense] {
        var filtered = expenses
        if selectedCategory != "All" { filtered = filtered.filter { $0.category == selectedCategory } }
        if selectedPaymentMethod != "All" { filtered = filtered.filter { $0.paymentMethod == selectedPaymentMethod } }
        return filtered
    }
    
    var body: some View {
        VStack(spacing: 10) {
            
            // Filtrages
            HStack {
                Picker("Category", selection: $selectedCategory) {
                    ForEach(categories, id: \.self) { Text($0) }
                }
                Picker("Payment", selection: $selectedPaymentMethod) {
                    ForEach(paymentMethods, id: \.self) { Text($0) }
                }
            }
            .pickerStyle(.menu)
            Toggle("Show in Euro", isOn: $useEuro)
                .padding(.horizontal)
            
            List {
                let now = Date()
                let calendar = Calendar.current
                
                Section(header: Text("Today").foregroundColor(.blue)) {
                    let today = filterExpenses(manager.expenses.filter { calendar.isDateInToday($0.date) })
                    Text(formatAmount(today.reduce(0) { $0 + $1.amountYen }))
                }
                
                Section(header: Text("This Week").foregroundColor(.purple)) {
                    let week = filterExpenses(manager.expenses(forWeekOf: now))
                    Text(formatAmount(week.reduce(0) { $0 + $1.amountYen }))
                }
                
                Section(header: Text("This Month").foregroundColor(.orange)) {
                    let month = filterExpenses(manager.expenses.filter { calendar.component(.month, from: $0.date) == calendar.component(.month, from: now) })
                    Text(formatAmount(month.reduce(0) { $0 + $1.amountYen }))
                }
                
                Section(header: Text("Total").foregroundColor(.green)) {
                    let total = filterExpenses(manager.expenses)
                    Text(formatAmount(total.reduce(0) { $0 + $1.amountYen }))
                }
            }
        }
        .navigationTitle("Statistics")
    }
}
