import SwiftUI

struct AddExpenseView: View {
    
    @EnvironmentObject var manager: ExpenseManager
    
    @State private var amount = ""
    @State private var category = ""
    @State private var note = ""
    @State private var paymentMethod = "Cash"
    
    let methods = ["Cash","Card"]
    
    var body: some View {
        
        Form {
            
            // Picker pour les catégories existantes
            Picker("Choose Category", selection: $category) {
                Text("New category...").tag("")
                ForEach(manager.categories, id: \.self) { cat in
                    Text(cat).tag(cat)
                }
            }
            
            // TextField pour entrer une nouvelle catégorie si besoin
            TextField("Or enter new category", text: $category)
            
            TextField("Amount (¥)", text: $amount)
                .keyboardType(.decimalPad)
            
            TextField("Note", text: $note)
            
            Picker("Payment Method", selection: $paymentMethod) {
                ForEach(methods, id: \.self) { Text($0) }
            }
            
            Button("Add Expense") {
                if let value = Double(amount) {
                    let expense = Expense(
                        date: Date(),
                        amountYen: value,
                        paymentMethod: paymentMethod,
                        category: category.isEmpty ? "Uncategorized" : category,
                        note: note
                    )
                    
                    manager.addExpense(expense) // <- fonction correcte
                    
                    // Reset fields
                    amount = ""
                    category = ""
                    note = ""
                }
            }
        }
        .navigationTitle("New Expense")
    }
}
