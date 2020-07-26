struct Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 1 else {
            return intervals
        }
        
        var all = intervals
        var pointer = 0
        var nextPointer = pointer + 1
        var firstRange = all[pointer].first!...all[pointer].last!
        while true {
            guard nextPointer < all.count else {
                pointer += 1
                guard pointer < all.count else {
                    break
                }
                firstRange = all[pointer].first!...all[pointer].last!
                nextPointer = pointer
                continue
            }
            
            let secondRange = all[nextPointer].first!...all[nextPointer].last!
            if firstRange.overlaps(secondRange) {
                all[nextPointer][0] = min(all[pointer].first!,all[nextPointer].first!)
                all[nextPointer][1] = max(all[pointer].last!, all[nextPointer].last!)
                
                all.remove(at: pointer)
                
                firstRange = all[pointer].first!...all[pointer].last!
                continue
            }
            nextPointer += 1
        }
        return all
    }
}

Solution().merge([[1,3],[2,6],[8,10],[15,18]])
Solution().merge([[1,4],[0,2],[3,5]])

