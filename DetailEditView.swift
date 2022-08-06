
import SwiftUI

struct DetailEditView: View {
    @Binding var data: Workout.Data
    @State private var newTraining = ""
    
    var body: some View {
        Form {
            Section(header: Text("WOD")) {
                TextField("Title", text: $data.title)
                HStack {
                    Slider(value: $data.lengthInMin, in: 1...60, step: 1) {
                        Text("Length")
                    }
                    Spacer()
                    Text("\(Int(data.lengthInMin)) minutes")
                }
                TextField("Type", text: $data.type)
            }
            Section(header: Text("Exercices")) {
                ForEach(data.trainings) { training in
                    Text(training.name)
                }
                .onDelete { indices in
                    data.trainings.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Exercise", text: $newTraining)
                    Button(action: {
                        withAnimation {
                            let training = Workout.Training(name: newTraining)
                            data.trainings.append(training)
                            newTraining = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newTraining.isEmpty)
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(Workout.sampleData[0].data))
    }
}
