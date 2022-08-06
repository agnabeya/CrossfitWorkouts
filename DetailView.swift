import SwiftUI

struct DetailView: View {
    @Binding var workout: Workout
    
    @State private var data = Workout.Data()
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("WOD Info")) {
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(workout.lengthInMin) min")
                    
                }
                HStack {
                    Label("Type", systemImage: "circle.square")
                    Spacer()
                    Text("\(workout.type)")
                }
            }
            Section(header: Text("Exercices")) {
                ForEach(workout.trainings) { training in
                    Label(training.name, systemImage: "figure.walk.circle")
                }
            }
        }
        .navigationTitle(workout.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                data = workout.data
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView(data: $data)
                    .navigationTitle(workout.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                workout.update(from: data)
                            }
                        }
                    }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(workout: .constant(Workout.sampleData[0]))
        }
    }
}
