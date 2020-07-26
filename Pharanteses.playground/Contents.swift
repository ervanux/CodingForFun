import Foundation

//class Solution {
//    func isValid(_ s: String) -> Bool {
//        guard s.count % 2 == 0 else {
//            return false
//        }
//
//        if s.isEmpty {
//            return true
//        }
//
//        let first = s.first!
//        let opposit = getOpposit(first)
//
//        var firstPart = ""
//        var second: String.Index?
//        repeat {
//            second = s.firstIndex(of:opposit)
//            guard second == nil else {
//                return false
//            }
//            firstPart = String(s[s.index(s.startIndex, offsetBy: 1)..<second!])
//        } while (firstPart.contains(first))
//
//        let secondPlus = s.index(second!, offsetBy: 1)
//        let secondPart = String(s[secondPlus...])
//
//        return isValid(firstPart) && isValid(secondPart)
//    }
//
//    func getOpposit(_ character: Character) -> Character {
//        switch (character) {
//            case "(": return ")"
//            case ")":  return "("
//            case "{": return "}"
//            case "}": return "{"
//            case "[": return "]"
//            case "]": return "["
//            default : fatalError("Shouldn't happend")
//        }
//    }
//}

class Solution {
//    let pairs: [Character: Character] = ["{":"}","(":")","[":"]"]
//    let keys: Int { return pairs.keys }
    
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()

        guard s.count % 2 == 0 else {
            return false
        }
                
        for (index, next) in s.enumerated() {
            if next.isClose() {
                guard let last = stack.popLast() else {
                    return false
                }
                
                if  next.opposit() != last {
                    return false
                }
            } else {
                stack.append(next)
                if s.count - index < stack.count {
                    return false
                }
            }
        }
        
        return true
        
    }
}

extension Character {
    func isClose() -> Bool {
        switch (self) {
            case ")":
                return true
            case "}":
                return true
            case "]":
                return true
            default :
                break
        }
        return false
    }
    
    func opposit() -> Character {
        switch (self) {
            case ")":
                return "("
            case "}":
                return "{"
            case "]":
                return "["
            default :
                fatalError("shouldn't happen \(self)")
        }
    }
}




Solution().isValid("()")
