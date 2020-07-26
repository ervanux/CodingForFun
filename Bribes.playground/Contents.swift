import Foundation
import XCTest

//func minimumBribes( q: [Int]) -> Void {
//    for (index, person) in q.enumerated() {
//        if person - index > 3 {
//            print("Too chaotic")
//            return
//        }
//    }
//
//    var queue = q
//    let count = queue.count
//    var bribes = [UInt8](repeating: 0, count: count)
//    for i in 1..<count {
//        for j in 0..<count-i {
//            let first = queue[j]
//            if  first > queue[j+1] {
//                let val = first - 1
//                if bribes[val] == 2 {
//                    print("Too chaotic")
//                    return
//                }
//                bribes[val] += 1
//                queue.swapAt(j, j + 1)
//            }
//        }
//    }
//    print(bribes.reduce(0, +))
//}


func minimumBribes( q: [Int]) -> Void {
    var queue = q
    var allBribes = 0
    
    while queue.count > 0 {
        let count = queue.count
        guard let index = queue.suffix(3).firstIndex(of: count) else {
            print("Too chaotic")
            return
        }

        allBribes += count - (index + 1)
        queue.remove(at: index)
    }
    print(allBribes)
}

let path = "/Users/e/Developer/Bribes.playground/Resources/input6.txt"
errno = 0

if freopen(path, "r", stdin) == nil {
    perror(path)
}

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for _ in 1...t {
    guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    guard let qTemp = readLine() else { fatalError("Bad input") }
    let q: [Int] = qTemp.split(separator: " ").map {
        if let qItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return qItem
        } else { fatalError("Bad input") }
    }

    guard q.count == n else { fatalError("Bad input") }

    minimumBribes(q: q)
}


//var q = [1, 2, 5, 3, 7, 8, 6, 4]
//
//class MyTestCase : XCTestCase {
//    override func setUp() {
//        super.setUp()
//
//    }
//
//    func testTe() {
//        measure {
//            minimumBribes(q: q)
//        }
//        assert(true)
//    }
//}
//
//
//class TestObserver: NSObject, XCTestObservation {
//    func testCase(_ testCase: XCTestCase,
//                  didFailWithDescription description: String,
//                  inFile filePath: String?,
//                  atLine lineNumber: Int) {
//        assertionFailure(description, line: UInt(lineNumber))
//    }
//}
//
//let testObserver = TestObserver()
//XCTestObservationCenter.shared.addTestObserver(testObserver)
//MyTestCase.defaultTestSuite.run()
