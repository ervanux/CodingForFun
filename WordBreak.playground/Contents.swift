/// https://leetcode.com/problems/word-break/

final class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        func wordBreak(_ sub: Substring) -> Bool {
            var pointer: String.Index = sub.startIndex
            wh: while true {
                for word in wordDict {
                    if sub[pointer...].starts(with: word) {
                        pointer = sub.index(pointer, offsetBy: word.count)
                        if pointer == sub.endIndex {
                            return true
                        }
                        continue wh
                    }
                }
                pointer = sub.startIndex
            }
            return false
        }
            
        let first = Set(s.unicodeScalars)
        let second = Set(wordDict.joined().unicodeScalars)
        if first.count > second.count {
            return false
        }
        if !first.isSubset(of: second) {
            return false
        }
        
        return wordBreak(s[s.startIndex...])
    }
}

//Solution().wordBreak("leetcode", ["leet","code"])
//Solution().wordBreak("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab",["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"])
//
//Solution.init().wordBreak("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabaabaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
//    ,["aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa","ba"])
//
//Solution().wordBreak("bb", ["a","b","bbb","bbbb"])

Solution().wordBreak("cars",["car","ca","rs"])
