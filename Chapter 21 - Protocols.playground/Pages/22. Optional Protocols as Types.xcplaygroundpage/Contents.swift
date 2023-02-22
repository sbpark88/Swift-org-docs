import Foundation

@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}


class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}

//class ThreeSource: CounterDataSource {
//    let fixedIncrement = 3
//}

//var counter = Counter()
//counter.dataSource = ThreeSource()
//
//for _ in 1...4 {
//    counter.increment()
//    print(counter.count)
//}


class TowardsZeroSource: NSObject, CounterDataSource {
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}

var counter = Counter()
counter.count = -4
counter.dataSource = TowardsZeroSource()

Array(1...5).forEach { _ in
    counter.increment()
    print(counter.count)
}
