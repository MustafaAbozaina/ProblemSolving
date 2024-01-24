//
//  GraphsTests.swift
//  GraphsTests
//
//  Created by mustafa salah eldin on 7/3/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class GraphsTests: XCTestCase {
    let aVertex = Vertex(data: "A")
    let bVertex = Vertex(data: "B")
    let cVertex = Vertex(data: "C")
    let dVertex = Vertex(data: "D")
    let eVertex = Vertex(data: "E")
    let fVertex = Vertex(data: "F")
    let gVertex = Vertex(data: "G")
    let hVertex = Vertex(data: "H")
    
    let vertex0 = Vertex(data: 0)
    let vertex1 = Vertex(data: 1)
    let vertex2 = Vertex(data: 2)
    let vertex3 = Vertex(data: 3)
    let vertex4 = Vertex(data: 4)
    let vertex5 = Vertex(data: 5)
    let vertex6 = Vertex(data: 6)
    let vertex7 = Vertex(data: 7)
    let vertex8 = Vertex(data: 8)
    
    
    func test_dfSTraverse() {
       

        var graphVertices = [Vertex<String>: [Vertex<String>]]()
        graphVertices[aVertex] = [bVertex, cVertex]
        graphVertices[bVertex] = [eVertex, cVertex]
        graphVertices[cVertex] = [dVertex, eVertex]
        graphVertices[dVertex] = [eVertex, bVertex]
        graphVertices[fVertex] = [eVertex]
//        graphVertices[eVertex] = [fVertex]
        
      
        let graph = DefaultDirectedGraph<String>(vertices: graphVertices)
//        let result = getDFSTraverse(graph: graph, source: aVertex)
//        XCTAssertEqual(result, ["a","c", "d", "b", "e"])
        var visited = [Vertex<String>: Bool]()
//        getDFSTraverseRecursion(graph: graph, source: aVertex, visited: &visited)
//        getDFSTraverseRecursion(graph: graph, source: aVertex, visited: &visited)

//        getBFSTraverse(graph: graph, source: aVertex) // visited: &visited
        var visitedSet = Set<Vertex<String>>()
        
        XCTAssertFalse(hasPath(graph: graph, src: aVertex, dst: fVertex, visited: &visitedSet))
    }
    
    func getDFSTraverse(graph: DefaultDirectedGraph<String>, source: Vertex<String>) -> [String] {
        var result: [String] = []
        var stack = [source]
        var visited = [Vertex<String>: Bool]()
        while stack.count > 0 {
            let current = stack.removeLast()
            print(current.data)
            result.append(current.data)
            let vertices = graph.vertices
            for vert in vertices[current] ?? [] {
                if visited[vert] == nil {
                stack.append(vert)
                visited[vert] = true
                }
            }
        }
        return result
    }
    
    func getDFSTraverseRecursion<T>(graph: DefaultDirectedGraph<T>, source: Vertex<T>, visited: inout Set<Vertex<T>>) {
        visited.insert(source)
        print(source.data)
        for vert in graph.vertices[source] ?? [] {
            if visited.contains(vert) == false {
                getDFSTraverseRecursion(graph: graph, source: vert, visited: &visited)
            }
        }
    }
    
    func getBFSTraverse<T: Hashable>(graph: DefaultDirectedGraph<T>, source: Vertex<T>) {

        var queue = [ source ]
        var visited = [Vertex<T>: Bool]()
        while (queue.count > 0) {
            let current  = queue.removeFirst()
            if visited[current] == nil {
                visited[current] = true
                print(current.data)
                queue.append(contentsOf: graph.vertices[current] ?? [])
            }
        }
    }
    
    func hasPath<T>(graph: DefaultDirectedGraph<T>, src: Vertex<T>, dst: Vertex<T>, visited: inout Set<Vertex<T>>) -> Bool {
        if src === dst { return true }
        if visited.contains(src) { return false }
        debugPrint(src.data)
        visited.insert(src)
        for vert in graph.vertices[src] ?? [] {
            if hasPath(graph: graph, src: vert, dst: dst, visited: &visited) {
              return true
            }
        }
        
        return false
    }
    
    func getNumberOfConnectedComponents<T>(graph: DefaultDirectedGraph<T>) -> (count: Int, largest: Int, disconnectedComponentsVertices: Set<Vertex<T>>) {
        var vertices = graph.vertices
        // consider all vertices
        // check the source and know if there are still nodes note visited
        
        var disconnectedGraphs = Set<Vertex<T>>()
        // traverse other nodes so If It visited before continue else complete for childs and after finishing them count by +1
        var count = 0
        var largestIsland = 0
        var visited = Set<Vertex<T>>()
        while(vertices.count > 0) {
            // while origin vertices exist complete and If any of them visited, delete them from that being discovered
            count += 1
            let source = vertices.first!.key
            disconnectedGraphs.insert(source)
            getDFSTraverseRecursion(graph: graph, source: source, visited: &visited)
            
            // Return the rest of unvisited vertices
            vertices = vertices.filter({!visited.contains($0.key)})
            
            if largestIsland < visited.count {
                largestIsland = visited.count
            }
            
            visited.removeAll()
        }
        
        return (count, largestIsland, disconnectedGraphs)
    }
    
    func test_unconnectedGraph() {
        var connectedComponenets = [Vertex<String>: [Vertex<String>]]()
        connectedComponenets[aVertex] = [bVertex]
        connectedComponenets[bVertex] = [cVertex, aVertex]
        connectedComponenets[cVertex] = [bVertex]
        connectedComponenets[dVertex] = [eVertex]
        connectedComponenets[eVertex] = [dVertex]
        connectedComponenets[fVertex] = [gVertex]
        connectedComponenets[gVertex] = [hVertex,fVertex]
        connectedComponenets[hVertex] = [gVertex]
        
//        var connectedComponenets = [Vertex<Int>: [Vertex<Int>]]()
//        connectedComponenets[vertex0] = [vertex8, vertex1, vertex5]
//        connectedComponenets[vertex1] = [vertex0]
//        connectedComponenets[vertex5] = [vertex0, vertex8]
//        connectedComponenets[vertex8] = [vertex0, vertex5]
//        connectedComponenets[vertex2] = [vertex3, vertex4]
//        connectedComponenets[vertex3] = [vertex2, vertex4]
//        connectedComponenets[vertex4] = [vertex3,vertex2]
        
        let disconnectedGraph = DefaultDirectedGraph<String>(vertices: connectedComponenets)
        
        let connectedComponentsCount = getNumberOfConnectedComponents(graph: disconnectedGraph)
        XCTAssertEqual(connectedComponentsCount.count, 3)
    }
    
    func test_largestIsland() {
        var vertices = [Vertex<Int>: [Vertex<Int>]]()
        vertices[vertex0] = [vertex5, vertex1, vertex8]
        vertices[vertex1] = [vertex0]
        vertices[vertex5] = [vertex0, vertex8]
        vertices[vertex8] = [vertex0, vertex5]
        vertices[vertex2] = [vertex3, vertex4]
        vertices[vertex3] = [vertex2, vertex4]
        vertices[vertex4] = [vertex3,vertex2]
        
        let connectedGraph = DefaultDirectedGraph<Int>(vertices: vertices)

        let connectedComponents = getNumberOfConnectedComponents(graph: connectedGraph)
        XCTAssertEqual(connectedComponents.count, 2)
        XCTAssertEqual(connectedComponents.largest, 4)

    }
    
    func largestIsland()  {
        // loop through connected and when I back with visited I know Its cound
        
    }
    
    func test_shortestPath() {
        let edges = [
            ["w", "x"],
            ["x", "y"],
            ["z", "y"],
            ["z", "v"],
            ["w", "v"]
        ]
        // undirectedGraph
        let shortestPath = getShortestPathBetween(src: "x", dst: "v", edges: edges)
        
        XCTAssertEqual(shortestPath, 2)
    }
    
    func getShortestPathBetween(src: String, dst: String, edges: [[String]]) -> Int {
        let directedGraph = DefaultDirectedGraph<String>()
        for edge in edges {
            let src = edge.first ?? ""
            let dst = edge.last ?? ""
            directedGraph.setVertex(data: src, neighbours: [dst])
            directedGraph.setVertex(data: dst, neighbours: [src])
        }
        var visited = Set<Vertex<String>>()
        let destination = getBFSWithDestination(graph: directedGraph, src: directedGraph.getVertexOf(data: src)!, dst: directedGraph.getVertexOf(data: dst)!, visited: &visited)
        
        return destination ?? 0
    }
    
    func getBFSWithDestination<T>(graph: DefaultDirectedGraph<T>, src: Vertex<T>, dst: Vertex<T>, visited: inout Set<Vertex<T>>) -> Int? {
        let destance = 0
        var queue = [(vertex:src, destination: destance)]
        
        while queue.count > 0 {
            let current = queue.removeFirst()
            visited.insert(current.vertex)
            
            for vert in graph.vertices[current.vertex] ?? [] {
                if vert.data == dst.data {
                    return current.destination + 1
                }
                queue.append((vert, current.destination + 1))
            }
        }
        return nil
    }
  
    
    func test_island() {
        let arr = [
            [0,1,1,0],
            [1,1,0,1],
            [0,1,0,0],
            [1,0,1,0],
            [0,1,1,1]
        ]
        var visited = Set<String>()
        var count = 0
        var sizes = [Int]()
        for r in 0..<arr.count {
            for c in 0..<arr[r].count {
                let (isLand, size) = exploreIsland(arr: arr, row:r, col:c , visited: &visited)
                if isLand {
                    count += 1
                    sizes.append(size)
                }
            }
        }
        print("Holla \(count)", "Visited", visited, "Sizes", sizes)
        
    }
    
    
        
    func exploreIsland(arr: [[Int]], row: Int, col: Int, visited: inout Set<String>) -> (isLand: Bool, count: Int)  {
        
        // check out of bound
        if row >= arr.count || row < 0 {
            return (false, 0)
        }
        
        if col >= arr[row].count || col < 0{
            return (false, 0)
        }
    
        // check water
        if arr[row][col] == 0 {
         return (false, 0)
        }
        
        // check visited
        let point = "\(row),\(col)"
        
        if visited.contains(point) {
            return (false, 0)
        } else {
            visited.insert(point)
        }
        
        var size = 1
        
        var rowColValues: [(row: Int, col: Int)] = [
            (row, col+1), // right
            (row, col-1), // left
            (row+1, col) // bottom
        ]
        
        for rowColValue in rowColValues {
            let (isLand, landSize) = exploreIsland(arr: arr, row: rowColValue.row, col: rowColValue.col, visited: &visited)
            if isLand {
                size += landSize
            }
        }
        
        // right
//        let (isLand, landSize) = exploreIsland(arr: arr, row: row, col: col+1, visited: &visited)
//        if isLand {
//            size += landSize
//        }
//
//        // left
//        let (isLand, landSize) = exploreIsland(arr: arr, row: row, col: col-1, visited: &visited)
//        if isLand {
//            size += 1
//        }
//
//        // bottom
//        if exploreIsland(arr: arr, row: row+1, col: col, visited: &visited).isLand {
//            size += 1
//        }
//
//        // top
//        if exploreIsland(arr: arr, row: row-1, col: col, visited: &visited).isLand {
//            size += 1
//        }
        
        return (true,size)
    }
}

class Islands {
    
    func getIslandsCount() {
        
    }
    
    func getLargestIsland() {
        
    }
}

func solutionsIdeas() {
    // get number of compnenets: the main Idea is to
    // 1- loop through all exist nodes (while vertices.count > 0)
    // 2- every depth first search the loop will exit with visited nodes
    // 3- inside the while loop we remove visited from vertices and complete
    // 4- If we need the larget island we just check the number of the visited nodes count
    
    // We can also make the DFS return Int with size of the component + Its child
    // var size = 1
    // for vert in graph[current].vertices {
    // size += recursion(graph, vert)
    //
}
