import Foundation

public class Solution {
    public init() {}
    public var copyGrid: [[Character]]!
    
    public func numIslands(_ grid: [[Character]]) -> Int {
        copyGrid = grid
        var landIndex = 64
        
        var newIndex: (x:Int, y:Int)?  = nextIndex()
        while newIndex != nil  {
            if !isSameLand(x: newIndex!.x, y: newIndex!.y, landIndex: Character(UnicodeScalar(landIndex)!)){
                landIndex += 1
            }
            fillLandIndex(x:newIndex!.x,y:newIndex!.y, landIndex: Character(UnicodeScalar(landIndex)!))
            newIndex = nextIndex()
        }
        
        return landIndex - 64
    }
    
    func isSameLand(x: Int, y: Int, landIndex: Character) -> Bool {
        if y+1 < copyGrid[x].count && copyGrid[x][y+1] == landIndex {
            return true
        }
        if x+1 < copyGrid.count && copyGrid[x+1][y] == landIndex {
            return true
        }
        
        if y-1 > -1 && copyGrid[x][y-1] == landIndex{
            return true
        }
        
        if x-1 > -1 && copyGrid[x-1][y] == landIndex{
            return true
        }
        
        return false
    }
    
    func nextIndex() -> (x: Int, y: Int)? {
        for (x, row) in copyGrid.enumerated() {
            if let y = row.firstIndex(of:"1") {
                return (x, y)
            }
        }
        return nil
    }
    
    func fillLandIndex(x: Int,y: Int,landIndex: Character) {
        if copyGrid[x][y] == "1" {
            copyGrid[x][y] = landIndex
            if y+1 < copyGrid[x].count {
                fillLandIndex(x:x, y:y+1, landIndex:landIndex)
            }
            if x+1 < copyGrid.count {
                fillLandIndex(x:x+1, y:y, landIndex:landIndex)
            }
            
            if y-1 > -1 {
                fillLandIndex(x:x, y:y-1, landIndex:landIndex)
            }
            
            
            if x-1 > -1 {
                fillLandIndex(x:x-1, y:y, landIndex:landIndex)
            }
        }
    }
}
