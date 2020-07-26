import Foundation
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    let grid:[[Character]]
    
    init(grid: [[Character]]) {
        self.grid = grid
        if #available(iOS 14.0, *) {
            // iOS 14 doesn't have extra separators below the list by default.
        } else {
            // To remove only extra separators below the list:
            UITableView.appearance().tableFooterView = UIView()
            UITableView.appearance().separatorColor = .clear
        }
        
        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        VStack{
            HStack(spacing:0){
                List {
                    ForEach (0..<self.grid.count){ rowIndex in
                        HStack(spacing: 0) {
                            ForEach(0..<self.grid[rowIndex].count) { column in
                                Cell(string: self.grid[rowIndex][column]).background(Color.green)
                            }
                        }.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                }.environment(\.defaultMinListRowHeight, 20)
            }
        }
    }
}

struct Cell: View {
    let string: Character
    
    var body: some View {
        (string == "0" ? Color.blue : Color.black)
    }
}


struct All: View {
    let newGrid: Solution = Solution()
    var count = 0
    init() {
        self.count = newGrid.numIslands(grid)
        print(count)
    }
    
    var body: some View {
        VStack {
//            ContentView(grid: grid)
            Text("\(count)").background(Color.red)
            ContentView(grid: newGrid.copyGrid)
        }
    }
}

//PlaygroundPage.current.setLiveView(All())


