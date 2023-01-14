import Foundation

class TemperatureLogger {
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
}


let logger = TemperatureLogger(label: "Outdoors", measurement: 25)
print(logger.label)     // Outdoors
//print(logger.max)       // error: 'max' is inaccessible due to 'private' protection level
print(logger.getMax())  // 25
