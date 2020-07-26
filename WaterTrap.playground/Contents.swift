/// https://leetcode.com/problems/trapping-rain-water/

final class Solution {
    
    final func trap(_ height: [Int]) -> Int {
        
        func findStart(_ startFrom: Int) -> Int? {
            var pointer = startFrom
            while pointer + 2 < height.count {
                if height[pointer] > height[pointer + 1] {
                    return pointer
                }
                pointer += 1
            }
            
            return nil
        }
        
        func findEnd(_ startSearch: Int, minHeight: Int) -> Int? {
            var pointer = startSearch
            while pointer < height.count {
                if height[pointer] >= minHeight {
                    return pointer
                }
                pointer += 1
            }
            
            let remain = height[(startSearch - 1)...]
            if let biggestAfterStart = remain.sorted().last {
                return remain.firstIndex(where: {$0 == biggestAfterStart})!
            }
            
            return nil
        }
        
        func calculate(_ startIndex: Int, _ endIndex: Int) -> Int {
            let startVal = height[startIndex]
            let endVal = height[endIndex]
            let distance = abs(startIndex - endIndex) - 1
            var wholeArea = distance * min(startVal, endVal)
            for index in stride(from: startIndex + 1, to: endIndex, by: 1) {
                wholeArea -= height[index]
            }
            return wholeArea
        }
        
        
        var allTraps = 0
        var pointer = 0
        while true {
            guard let startIndex = findStart(pointer) else {
                break
            }

            guard let endIndex = findEnd(startIndex + 2, minHeight: height[startIndex]) else {
                pointer = startIndex + 1
                continue
            }
            allTraps += calculate(startIndex, endIndex)
            pointer = endIndex
        }
    
        return allTraps
    }
}

Solution().trap([0,1,0,2,1,0,1,3,2,1,2,1]) == 6
Solution().trap([1,3,2,1,2,1]) == 1
Solution().trap([4,2,3]) == 1
Solution().trap([4,4,4,7,1,0]) == 0
Solution().trap([0,2,0]) == 0
Solution().trap([0,7,1,4,6]) == 7
