
import SwiftUI

struct CardView: View {
    let workout: Workout
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(workout.title)
                .font(.headline)
                .frame(height: 32)
            Spacer()
            HStack {
                Label("\(workout.type)", systemImage: "circle.square")
                    .frame(width: 90, height: 20, alignment: .topLeading)
                Spacer()
                Label("\(workout.trainings.count)", systemImage: "figure.walk.circle")
                    .frame(width: 50, height: 20, alignment: .topLeading)
                Spacer()
                Label("\(workout.lengthInMin)", systemImage: "clock")
                    .frame(width: 55, height: 20, alignment: .topLeading)
            }
            .font(.caption)
        }
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var workout = Workout.sampleData[0]
    static var previews: some View {
        CardView(workout: workout)
            .previewLayout(.fixed(width: 400, height: 40))
    }
}
