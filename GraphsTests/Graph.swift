//
//  Graph.swift
//  GraphsTests
//
//  Created by mustafa salah eldin on 10/14/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import Foundation

protocol DatabaseManagerP {
    associatedtype E
    
    func create() -> E
}

protocol DirectedGraph {
    associatedtype E where E: Hashable
    
    var vertices: [Vertex<E>: [Vertex<E>]] {get set}
    func getVertexOf(data: E) -> Vertex<E>?
    func setVertex(data: E, neighbours: [E]) -> Vertex<E>
//    var visited: Set<Vertex<E>> {get set}
    subscript(vertex: Vertex<E>) -> [Vertex<E>]? {get set}
}

class DefaultDirectedGraph<T: Hashable>: DirectedGraph {
//    var visited: Set<Vertex<T>> = []
    var vertices: [Vertex<T> : [Vertex<T>]] = [:]
    
    init(vertices: [Vertex<T> : [Vertex<T>]] = [:]) {
        self.vertices = vertices
    }
    
    @discardableResult
    func setVertex(data: T, neighbours: [T]) -> Vertex<T> {
        let vertex = createVertex(data: data)
        let neighbours = createNeighbours(neighbours: neighbours)
        vertices[vertex]?.append(contentsOf: neighbours)
        return vertex
    }
    
    func createVertex(data: T) -> Vertex<T> {
        var vertex: Vertex<T>
        if let existedVertex = getVertexOf(data: data)  {
            vertex = existedVertex
        } else {
            let newVertex = Vertex(data: data)
            vertices[newVertex] = []
            vertex = newVertex
        }

        return vertex
    }
    
    private func createNeighbours(neighbours: [T]) -> [Vertex<T>] {
        var vertices: [Vertex<T>] = []
        for neighbour in neighbours {
            vertices.append(createVertex(data: neighbour))
        }
        return vertices
    }
    
    func getVertexOf(data: T) -> Vertex<T>? {
        for (vertex, _) in vertices {
            if vertex.data == data {
                return vertex
            }
        }
        return nil
    }
    
    typealias E = T
    
    private func setBidirectionalConnection(first: Vertex<T>, second: Vertex<T>) {
        guard let firstAdjacentVertices = vertices[first], let  secondAdjacentVertices = vertices[second] else {
            return
        }
        if firstAdjacentVertices.doesntContain(second) {
            vertices[first]?.append(second)
        }
        if secondAdjacentVertices.doesntContain(first){
            vertices[second]?.append(first)
        }
    }
        
    subscript(vertex: Vertex<T>) -> [Vertex<T>]? {
        get {
            return vertices[vertex]
        }
        set {
            self.vertices[vertex]?.append(contentsOf: newValue ?? [])
        }
        
    }
    
    enum ConnectionType {
        case direct
        case indirect
    }
    
    func connect(first: Vertex<T>, second: Vertex<T>, connectionType: ConnectionType) {
        if connectionType == .indirect {
            setBidirectionalConnection(first: first, second: second)
        } else {
            if self[first]?.doesntContain(second) ?? false {
                self[first]?.append(second)
            }
        }
    }
    
    func getVertex(value: T) -> Vertex<T>? {
        var targetVertex: Vertex<T>?
        for (key, _) in vertices {
            if key.data == value {
                targetVertex = key
                
            }
        }
        return targetVertex
    }
    
    func hasPathDFS(source: T, destination: T, visited:inout Set<T>) -> Bool {
        if (visited.contains(source)){
            return false
        }
        visited.insert(source)
        
        if source == destination {
            return true
        }
        if let sourceNode: Vertex<T> = getVertexOf(data: source) {
            for adjacencyVertex in self[sourceNode] ?? [] {
                return hasPathDFS(source: adjacencyVertex.data, destination: destination, visited: &visited)
            }
        }
        return false
    }
    
//    func hasLargestConnectionsNumber(vertices: Vertex<T>) -> Vertex<T> {
//        var largestNumber = 0
//        // visit all nodes
//        let graph = DefaultDirectedGraph<Int>()
//
//        return graph
//    }
    
}

class Graph<T: Hashable, W> {
    var vertices: [Vertex<T>: [Edge<T, W>]] = [:]
}

class Vertex<T> {
    var data: T
    
    init(data: T) {
        self.data = data
    }
}

extension Vertex: Equatable where T: Equatable {
    static func == (lhs: Vertex, rhs: Vertex) -> Bool {
        return (lhs.data == rhs.data && lhs === rhs) // data and references
    }
}
extension Vertex: Hashable where T: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(data) // self instead of data
    }
}

struct Edge<VertexValueType,Weight> {
    var source: Vertex<VertexValueType>
    var destination: Vertex<VertexValueType>
    
    enum EdgeType  {
        case directed(Weight)
        case undirected(Weight)
    }
}

extension Array where Element: Hashable {
    func doesntContain(_ element: Element) -> Bool {
        return !self.contains(element)
    }
}
