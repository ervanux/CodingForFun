/// https://leetcode.com/problems/word-break/

final class Solution {
    func wordBreak2(_ sub: Substring, _ wordDict: [String], start: Int, stop: Int) -> Bool {
        if sub.isEmpty {
            return true
        }
        
        if start >= wordDict.count || stop >= wordDict.count {
            return false
        }
        
        var newSub = sub
        
        var newStart = start
        let startWord = wordDict[newStart]
        if newSub.prefix(startWord.count) == startWord {
            let nextStartIndex = newSub.index(newSub.startIndex, offsetBy: startWord.count)
            if nextStartIndex == newSub.index(before: newSub.endIndex) {
                return true
            }
            newSub = newSub[nextStartIndex...]
            newStart = 0
        } else {
            newStart += 1
        }
        
        var newStop = stop
        let stopWord = wordDict[newStop]
        if newSub.suffix(stopWord.count) == stopWord {
            let nextStopIndex = newSub.index(newSub.endIndex, offsetBy: -(stopWord.count))
            if nextStopIndex == newSub.startIndex {
                return true
            }
            newSub = newSub[..<nextStopIndex]
            newStop = 0
            newStart = 0
        } else {
            newStop += 1
        }

        return wordBreak2(newSub, wordDict, start: newStart, stop: newStop)
        
    }

    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        return wordBreak2(s[s.startIndex...], wordDict, start: 0,stop: 0)
    }
}

//Solution().wordBreak("leetcode", ["leet","code"])
//Solution().wordBreak("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab",["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"])
//////
//Solution.init().wordBreak("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabaabaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",["aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa","ba"])
//////
//Solution().wordBreak("bb", ["a","b","bbb","bbbb"])
////////
//Solution().wordBreak("cars",["car","ca","rs"])
//Solution().wordBreak("catsandog", ["cats","dog","sand","and","cat"])

Solution().wordBreak("goalspecial", ["go","goal","goals","special"])
