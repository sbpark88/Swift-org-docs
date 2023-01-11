import Foundation

actor TemperatureLogger {
    let label: String
    var measurements: [Int]
    private(set) var max: Int

    init(label: String, measurement: Int) {
        self.label = label
        self.measurements = [measurement]
        self.max = measurement
    }

    func getMax() -> Int {
        max
    }
}

Task {
    let logger = TemperatureLogger(label: "Outdoors", measurement: 25)
    print(await logger.label)               // Outdoors, No 'async' operations occur within 'await' expression
    print(logger.label)                     // Outdoors
//    logger.measurements[0] = 0              // error: actor-isolated property 'measurements' can not be mutated from a non-isolated context
//    print(logger.max)                       // error: expression is 'async' but is not marked with 'await'
    print("1. \(await logger.max)")         // 1. 25
    await print("2. \(logger.max)")         // 2. 25
    print("3. \(await logger.getMax())")    // 3. 25
    await print("4. \(logger.getMax())")    // 4. 25
}
