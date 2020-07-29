/// https://leetcode.com/problems/word-break/

struct Node{
    let wordIndex: Int
    var children = [Node]()
    
    mutating func add(child: Node) {
        children.append(child)
    }
}

final class Solution {
    private var wordDict: [String]!
    var root = Node(wordIndex: -1)

    func wordBreak2(_ deep: Int, _ sub: Substring, _ wordDict: [String]) -> Bool {
        for word in wordDict where sub.starts(with: word) {
            let pointer = sub.index(sub.startIndex, offsetBy: word.count)
            if pointer == sub.endIndex {
                return true
            }
            if wordBreak2(deep + 1,sub[pointer...], wordDict) {
                return true
            }
        }
        return false
    }

    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let first = Set(s.unicodeScalars)
        let second = Set(wordDict.joined().unicodeScalars)
        if first.count > second.count {
            return false
        }
        if !first.isSubset(of: second) {
            return false
        }
        
        let sorted = wordDict.sorted { $0.count > $1.count }
        var array = [String]()
        for (index, word) in sorted.enumerated() {
            var new = sorted
            new.remove(at: index)
            if !wordBreak2(1, word[word.startIndex...], new) {
                array.append(word)
            }
        }
        
        self.wordDict = array
        fillChild(s: s[s.startIndex...], root: &root)
        return false
    }
    
    func fillChild(s: Substring, root: inout Node) {
        for (index, word) in wordDict.enumerated() where s.starts(with: word) {
            var child = Node(wordIndex: index)
            fillChild(s: s[s.index(s.startIndex, offsetBy: word.count)...], root: &child)
            root.add(child: child)
        }
    }
}

//Solution().wordBreak("leetcode", ["leet","code"])
//Solution().wordBreak("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab",["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"])
//////
Solution.init().wordBreak("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabaabaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",["aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa","ba"])
//////
//Solution().wordBreak("bb", ["a","b","bbb","bbbb"])
////////
//Solution().wordBreak("cars",["car","ca","rs"])
//Solution().wordBreak("catsandog", ["cats","dog","sand","and","cat"])

//Solution().wordBreak("goalspecial", ["go","goal","goals","special"])
