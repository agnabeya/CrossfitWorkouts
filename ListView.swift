
import SwiftUI

struct ListView: View {
    @Binding var workouts: [Workout]
    @State private var isPresentingNewView = false
    @State private var newWorkoutData = Workout.Data()
    
    var body: some View {
        List {
            ForEach($workouts) { $workout in
                NavigationLink(destination: DetailView(workout: $workout)) {
                    CardView(workout: workout)
                }
            }
            .onDelete(perform: delete)
        }
        .navigationTitle("WODs")
        .toolbar {
            Button(action: {
                isPresentingNewView = true
            }) {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $isPresentingNewView) {
            NavigationView {
                DetailEditView(data: $newWorkoutData)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingNewView = false
                                newWorkoutData = Workout.Data()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                let newWorkout = Workout(data: newWorkoutData)
                                workouts.append(newWorkout)
                                isPresentingNewView = false
                                newWorkoutData = Workout.Data()
                            }
                        }
                    }
            }
        }
    }
    func delete(at offsets: IndexSet) {
        workouts.remove(atOffsets: offsets)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView(workouts: .constant(Workout.sampleData))
        }
    }
}

