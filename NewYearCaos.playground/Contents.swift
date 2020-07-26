import Foundation

// Complete the minimumBribes function below.
func minimumBribes(q: [Int]) -> Void {
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

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for tItr in 1...t {
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
