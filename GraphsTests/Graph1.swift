////
////  Graph.swift
////  GraphsTests
////
////  Created by mustafa salah eldin on 7/3/22.
////  Copyright © 2022 Mustafa Abozaina. All rights reserved.
////
//
//import Foundation
//
//fileprivate struct Vertex<T> {
//    var data: T
//    var index: Int
//}
//
//fileprivate struct Edge<T> {
//    fileprivate let source: Vertex<T>
//    fileprivate let destination: Vertex<T>
//    fileprivate var weight: T?
//    fileprivate var edgeType: EdgeType = .directed
//}
//
//fileprivate enum EdgeType {
//    case directed
//    case undirected
//}
//
//extension Vertex: Hashable where T: Hashable {}
//extension Vertex: Equatable where T: Equatable {}
//
////The CustomStringConvertible protocol allows us to define a custom output. We are going to use it to print index and data of Vertex.
//extension Vertex: CustomStringConvertible {
//    var description: String {
//        return "\(index):\(data)"
//    }
//}
//
//fileprivate protocol Graph {
//    associatedtype Element //This allows the protocol to be generic, to hold any type.
//    // associated type not used in the conforming class it exist to let the conforming class use generic type
//    
//    func createNode(data: Element) -> Vertex<Element>
//    func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>)
//    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>)
//    
//    func add(edgeType: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>) // add(_:from:to) provides a utility to get an edge between two vertices,
//    
//    func edges(from source: Vertex<Element>) -> [Edge<Element>] // edges(from:) provides a utility to retrieve all the edges that source vertex connects to
//}
//
// class GraphConcrete <T: Hashable>: Graph {
//    
//    private var adjancencies: [Vertex<T>: [Edge<T>]] = [:]
//    var adjecent = LinkedList<T>()
//
//    init() {}
//    
//    fileprivate func createNode(data: T) -> Vertex<T> {
//
//        let vertex = Vertex(data: data, index: adjancencies.count)
//        adjancencies[vertex] = []
//        return vertex
//        
//    }
//    
//    fileprivate func getNode(data: T) -> Vertex<T>? {
//        for (node, _) in adjancencies {
//            if node.data == data {
//                return node
//            }
//        }
//        return nil
//    }
//    
//    fileprivate func addEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: T?) {
//        let edge = Edge(source: source, destination: destination, weight: weight)
//        adjancencies[source]?.append(edge)
//    }
//    
//    fileprivate func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>) {
//        
//        let edge = Edge(source: source, destination: destination)
//        adjancencies[source]?.append(edge)
//        
//    }
//    
//    fileprivate func addUndirectedEdge(between source: Vertex<T>, and destination: Vertex<T>) {
//        addDirectedEdge(from: source, to: destination)
//        addDirectedEdge(from: destination, to: source)
//    }
//    
//    fileprivate func add(edgeType edge: EdgeType, from source: Vertex<T>, to destination: Vertex<T>) {
//        
//        switch edge {
//        case .directed:
//            addDirectedEdge(from: source, to: destination)
//        case .undirected:
//            addUndirectedEdge(between: source, and: destination)
//        }
//    }
//    
//    fileprivate func edges(from source: Vertex<T>) -> [Edge<T>] {
//        return adjancencies[source] ?? []
//    }
//    
//    fileprivate func getAdjecentValues(from source: T) -> [T] {
//        guard let node = getNode(data: source) else { return [] }
//        let edges = edges(from: node)
//                
//        var destinations = [T]()
//        for edge in edges {
//            destinations.append(edge.destination.data)
//        }
//        return destinations
//    }
//    
//}
//
// extension GraphConcrete: CustomStringConvertible {
//    public var description: String {
//        var result = ""
//        for (node, edges) in adjancencies { // 1
//            var edgeString = ""
//            for (index, edge) in edges.enumerated() { // 2
//                if index != edges.count - 1 {
//                    edgeString.append("\(edge.destination), ")
//                } else {
//                    edgeString.append("\(edge.destination)")
//                }
//            }
//            result.append("\(node) ---> [ \(edgeString) ]\n") // 3
//        }
//        return result
//    }
//    
//}


