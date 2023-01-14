import Foundation

actor TemperatureLogger {
    let label: String
    var measurements: [Int]
    private var max: Int

    init(label: String, measurement: Int) {
        self.label = label
        self.measurements = [measurement]
        self.max = measurement
    }

    func getMax() -> Int {
        max
    }

    func greeting(name: String) {
        print("Hello~ \(name)")
    }
}

Task {
    let logger = TemperatureLogger(label: "Outdoors", measurement: 25)
    print(logger.label)                             // Outdoors
//    print(logger.max)                               // error: 'max' is inaccessible due to 'private' protection level
    print(await logger.getMax())                    // 25
    await logger.greeting(name: "Actor Methods")    // Hello~ Actor Methods
}
