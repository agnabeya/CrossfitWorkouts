import SwiftUI

@main
struct WorkoutApp: App {
    @State private var workouts = Workout.sampleData
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView(workouts: $workouts)
            }
        }
    }
}
