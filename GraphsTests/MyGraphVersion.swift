////
////  MyGraphVersion.swift
////  GraphsTests
////
////  Created by mustafa salah eldin on 7/3/22.
////  Copyright © 2022 Mustafa Abozaina. All rights reserved.
////
//
//import Foundation
//import XCTest
//
//class MyGraphVersionTests: XCTestCase {
//    
//    func test() {
//        let graph = Graph()
////        let vertices = [Vertex(data: 1), Vertex(data: 2), Vertex(data: 3)]
//        graph.addEdge(sourceData: 1, destinationData: 2, weight: 2)
//        graph.addEdge(sourceData: 1, destinationData: 2, weight: 2)
//        graph.addEdge(sourceData: 1, destinationData: 2, weight: 2)
//        
//        print(graph)
////        let graph = Graph()
////        var vertices: [Vertex] = []
////        for i in 0..<5 {
////            vertices.append(Vertex(data: i))
////        }
////        graph.vertices = vertices
////        graph.connectVertices(source: vertices[0], destination: vertices[1], direction: .bi)
////
////        XCTAssertEqual(vertices[1].adjacencyList, [vertices[0]])
////        XCTAssertEqual(vertices[0].adjacencyList, [vertices[1]])
//
//    }
//    
//    func test_connectCities() {
////        let n = 3
////        let cLib = 2
////        let cRoad = 1
////        let cities = [[1, 2], [3, 1], [2, 3]]
////        let graph = Graph()
////        var currentVertices = cities.map {Vertex(data:$0[1])}
////        for vert in currentVertices {
////            for another in currentVertices {
////                if vert != another {
////                    graph.connectVertices(source: vert, destination: another, direction: .uni)
////                }
////            }
////        }
////        XCTAssertEqual(graph.vertices[0].adjacencyList.count, 2)
////        XCTAssertEqual(graph.vertices[1].adjacencyList.count, 2)
////        XCTAssertEqual(graph.vertices[2].adjacencyList.count, 2)
////
//        
//        
//    }
//    
//}
//
//fileprivate enum EdgeType {
//    case uni
//    case bi
//}
//
//fileprivate struct Edge<T> {
//    fileprivate var destination: Vertex
//    fileprivate var weight: T?
//    fileprivate var edgeType: EdgeType = .uni
//}
//
//fileprivate protocol Graphable {
//    associatedtype T
//    var vertices:  [Vertex: [Edge<T>]] {get set}
//    func createVertex(data: Int) -> Vertex
//    func connectVertices(source: Vertex, destination: Vertex, edge: Edge<T>)
//    func addVertices(sourceData: Int, destinationData: Int, edge: Edge<T>)
//    func addEdge(sourceData: Int, destinationData: Int, weight: T?)
//    func deleteVertexOf(data: Int)
//    
//}
//
//// Concrete
//fileprivate class Vertex {
//    lazy var adjacencyList: [Vertex] = []
//    var data: Int
//    var weight: Int?
//    
//    init(data: Int) {
//        self.data = data
//    }
//}
//extension Vertex: Equatable {
//    static func == (lhs: Vertex, rhs: Vertex) -> Bool {
//        return (lhs.data == rhs.data && lhs.adjacencyList == rhs.adjacencyList)
//    }
//}
//extension Vertex: Hashable {
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(data)
//    }
//}
//
//
//fileprivate class Graph: Graphable {
//    var vertices:  [Vertex: [Edge<Int>]] = [:]
//
//    func createVertex(data: Int) -> Vertex {
//        let vertex = Vertex(data: data)
//        if vertices[vertex] == nil {
//            vertices[vertex] = []
//        }
//        return vertex
//    }
//    
//    func connectVertices(source: Vertex, destination: Vertex, edge: Edge<Int>) {
////        if !vertices.contains(where: {$0.data == source.data}) {
////            vertices.append(source)
////        }
////        connectTwoVertices(source: source, destination: destination)
////        if direction == .bi {
////            connectTwoVertices(source: destination, destination: source)
////        }
//    }
//    
//    private func connectTwoVertices(source: Vertex, edge: Vertex) {
////        guard !source.adjacencyList.contains(where: {$0 == destination})  else {
////            return
////        }
////        source.adjacencyList.append(destination)
//        
//    }
//    
//    func addVertices(sourceData: Int, destinationData: Int, edge: Edge<Int>) {
//        
//    }
//    // when make the function take Type Int the function not know the Original Int
//    func addEdge(sourceData: Int, destinationData: Int, weight: Int?) {
//        // if the data exist before in vertex so I'll grep It
////        var source: Vertex
////        var destination: Vertex
//        
//        let arr = vertices.keys.filter {$0.data == sourceData || $0.data == destinationData}
//        
//        let source = arr.first(where: {$0.data == sourceData}) ?? Vertex(data: sourceData)
//        let destination = arr.first(where: {$0.data == destinationData}) ?? Vertex(data: destinationData)
//        let edge = Edge<Int>(destination: destination, weight: weight)
//        if vertices[source] == nil {
//            vertices[source] = []
//        }
//        
//        vertices[source]?.append(edge)
//    }
//    
//    func deleteVertexOf(data: Int) {
//        
//    }
//    
//}
//
//// lets meke it first Integer and will convert to Generics
