//
//  Graph+HasPath.swift
//  GraphsTests
//
//  Created by mustafa salah eldin on 12/12/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import Foundation

extension DirectedGraph {
    func getDFSTraverse(source: Vertex<E>) -> [E] {
        var result: [E] = []
        var stack = [source]
        var visited = [Vertex<E>: Bool]()
        while stack.count > 0 {
            let current = stack.removeLast()
            print(current.data)
            result.append(current.data)
            let vertices = self.vertices
            for vert in vertices[current] ?? [] {
                if visited[vert] == nil {
                stack.append(vert)
                visited[vert] = true
                }
            }
        }
        return result
    }
    
    func getDFSTraverseRecursion( source: Vertex<E>, visited: inout Set<Vertex<E>>) {
        visited.insert(source)
        print(source.data)
        for vert in self.vertices[source] ?? [] {
            if visited.contains(vert) == false {
                getDFSTraverseRecursion(source: vert, visited: &visited)
            }
        }
    }
    
    func getBFSTraverse(source: Vertex<E>) {

        var queue = [ source ]
        var visited = [Vertex<E>: Bool]()
        while (queue.count > 0) {
            let current  = queue.removeFirst()
            if visited[current] == nil {
                visited[current] = true
                print(current.data)
                queue.append(contentsOf: self.vertices[current] ?? [])
            }
        }
    }
    
    func getAllConnectedVerticesIn(source: Vertex<E>) -> [Vertex<E>] {

        var queue = [ source ]
        var visited = [Vertex<E>: Bool]()
        while (queue.count > 0) {
            let current  = queue.removeFirst()
            if visited[current] == nil {
                visited[current] = true
                print(current.data)
                queue.append(contentsOf: self.vertices[current] ?? [])
            }
        }
        return Array(visited.keys)
    }
    
    mutating func hasPath(src: Vertex<E>, dst: Vertex<E>, visited: inout Set<Vertex<E>>) -> Bool {
        if src === dst { return true }
        if visited.contains(src) { return false }
        debugPrint(src.data)
        visited.insert(src)
        for vert in self.vertices[src] ?? [] {
            if hasPath(src: vert, dst: dst,visited: &visited) {
                return true
            }
        }
        return false
    }
    
    mutating func hasPath(src: E, dst: E, visited: inout Set<Vertex<E>>) -> Bool {
        let srcVertex = getVertexOf(data: src)
        let dstVertex = getVertexOf(data: dst)
        guard let srcVertex = srcVertex, let dstVertex = dstVertex else {return false}
        if srcVertex === dstVertex { return true }
        if visited.contains(srcVertex) { return false }
        debugPrint(srcVertex.data)
        visited.insert(srcVertex)
        for vert in self.vertices[srcVertex] ?? [] {
            if hasPath(src: vert.data, dst: dst, visited: &visited) {
                return true
            }
        }
        return false
    }
    
}
