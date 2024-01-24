//
//  Graph+Disconnected.swift
//  GraphsTests
//
//  Created by mustafa salah eldin on 12/14/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import Foundation

extension DirectedGraph {
    func getNumberOfConnectedComponents() -> (count: Int, largest: Int, disconnectedComponentsVertices: Set<Vertex<E>>) {
        var vertices = self.vertices
        // consider all vertices
        // check the source and know if there are still nodes note visited
        
        var disconnectedGraphs = Set<Vertex<E>>()
        // traverse other nodes so If It visited before continue else complete for childs and after finishing them count by +1
        var count = 0
        var largestIsland = 0
        var visited = Set<Vertex<E>>()
        while(vertices.count > 0) {
            // while origin vertices exist complete and If any of them visited, delete them from that being discovered
            count += 1
            let source = vertices.first!.key
            disconnectedGraphs.insert(source)
            
            getDFSTraverseRecursion(source: source, visited: &visited)
            
            // Return the rest of unvisited vertices
            vertices = vertices.filter({!visited.contains($0.key)})
            
            if largestIsland < visited.count {
                largestIsland = visited.count
            }
            
            visited.removeAll()
        }
        
        return (count, largestIsland, disconnectedGraphs)
    }
    
}
