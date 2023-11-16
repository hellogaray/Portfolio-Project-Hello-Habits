import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var manageObjContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Habit.title, ascending: true)],
        animation: .default)
    private var habit: FetchedResults<Habit>

    @State private var showingAddView = false

    var body: some View {
        NavigationView {
            VStack {
                TopBarView()
                
                // Habits Section
                VStack(alignment: .center, spacing: 16) {
                    ForEach(habit) { habit in
                        HabitCardView(title: habit.title ?? "", frequency: "", isReminderEnabled: habit.isReminderOn)
                    }
                }
                .padding()
                .background(Color(.systemBackground))
                
                BottomBarView(manageObjContext: _manageObjContext, showingAddView: $showingAddView)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
