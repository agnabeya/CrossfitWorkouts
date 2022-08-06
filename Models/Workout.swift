
import Foundation

struct Workout: Identifiable {
    let id: UUID
    var title: String
    var trainings: [Training]
    var lengthInMin: Int
    var type: String
    
    init(id: UUID = UUID(), title: String, trainings: [String], lengthInMin: Int, type: String) {
        self.id = id
        self.title = title
        self.trainings = trainings.map { Training(name: $0) }
        self.lengthInMin = lengthInMin
        self.type = type
    }
}

extension Workout {
    struct Training: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    struct Data {
        var title: String = ""
        var trainings: [Training] = []
        var lengthInMin: Double = 5
        var type: String = ""
    }
    
    var data: Data {
        Data(title: title, trainings: trainings, lengthInMin: Double(lengthInMin), type: type)
    }
    
    mutating func update(from data: Data) {
        title = data.title
        trainings = data.trainings
        lengthInMin = Int(data.lengthInMin)
        type = data.type
    }
    
    init(data: Data) {
        id = UUID()
        title = data.title
        trainings = data.trainings
        lengthInMin = Int(data.lengthInMin)
        type = data.type
    }
}

extension Workout {
    static let sampleData: [Workout] =
    [
        Workout(title: "Shuttle to Overhead",  trainings: ["Run 200m", "10 jerks", "Run 400m", "10 jerks", "Run 600m","10 jerks"], lengthInMin: 10, type: "AFAP"),
        Workout(title: "Bike to Work", trainings: ["20 GHD sit-ups", "10 left-arm dumbbell snatches", "10 right-arm dumbbell snatches"], lengthInMin: 12, type: "AMRAP"),
        Workout(title: "2021 CrossFit Games Event 9", trainings: ["Echo Bike calories", "Snatches"], lengthInMin: 5, type: "21-15-9"),
        Workout(title: "Grace", trainings: ["30 clean", "30 jerks"], lengthInMin: 15, type: "AFAP"),
        Workout(title: "Mary", trainings: ["5 handstand push-ups", "10 single-leg squats", "15 pull-ups"], lengthInMin: 20, type: "AMRAP")
    ]
}
