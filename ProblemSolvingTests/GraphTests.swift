//
//  GraphTests.swift
//  ProblemSolvingTests
//
//  Created by mustafa salah eldin on 2/18/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

fileprivate class GraphTests: XCTestCase {

    func test_currencies() {
        let exchangeArr = ["EURUSD", "USDGBP", "USDEGP", "EGPEUR", "GBPEGP", "USDAED", "GBPAED", "AEDEGP"]
        // get unique dic of currencies
        var currenciesSet = Set<String>()
        
        for item in exchangeArr {
            let firstCurrency = item.getSubString(fromIndex: 0, toIncludedIndex: 2)
            let secondCurrency = item.getSubString(fromIndex: 3, toIncludedIndex: 5)
            currenciesSet.insert(String(firstCurrency))
            currenciesSet.insert(String(secondCurrency))
        }
        print("set contains \(currenciesSet)")
        let graphNodes = GraphNodes<String>()
        var nodesArray: [Node<String>] = []
        for element in currenciesSet {
            nodesArray.append(graphNodes.createNode(data: element))
        }
        
        
        for item in exchangeArr {
            let firstCurrency = item.getSubString(fromIndex: 0, toIncludedIndex: 2)
            let secondCurrency = item.getSubString(fromIndex: 3, toIncludedIndex: 5)
            guard let firstNode = graphNodes.getNode(data: String(firstCurrency)) else {continue}
            for secondNode in nodesArray {
                if secondNode.data == secondCurrency {
                    graphNodes.addDirectedEdge(from: firstNode, to: secondNode)
                }
            }
        }
        
        XCTAssert(hasPathDFS(graph: graphNodes, source: "EUR", destination: "AED"))
//        XCTAssert(hasPathBFS(graph: graphNodes, source: "EUR", destination: "AED"))

        XCTAssertEqual(globalPathArr.reversed(), ["EUR","USD","AED"])
        
        print("graph nodes \(graphNodes)")
    }
    
//    func getBestRout(graph: GraphNodes<String>, currencies: Set<String>, source: String, destination: String) -> Array {
//        var array = []
//        for currency in currencies {
//            has
//        }
//        return []
//    }
    
    // Target EURAED -> so EURUSD, USDAED
    func hasPathDFS(graph: GraphNodes<String>, source: String, destination: String) -> Bool {
//        guard let sourceNode = graph.getNode(data: source) else { return false}
//        guard let destinationNode = graph.getNode(data: destination) else { return false}
        
        var visited: Set<String> = Set()
        return hasPathDFS(graph: graph, source: source, destination: destination, visited: &visited)
    }
    var globalPathArr = [String]()
    func hasPathDFS(graph: GraphNodes<String>, source: String, destination: String, visited:inout Set<String>) -> Bool {
        if (visited.contains(source)){
            return false
        }
        visited.insert(source)
        
        if source == destination {
            globalPathArr.append(source)
            return true
        }
        guard let sourceNode = graph.getNode(data: source) else {return false}
        let adjacentValues = graph.getAdjecentValues(from: sourceNode.data)
        for i in  0..<adjacentValues.count  {
            if hasPathDFS(graph: graph, source:  adjacentValues[i], destination: destination, visited: &visited) {
                globalPathArr.append(source)
                return true
                }
            }
        return false
    }
    
    func hasPathBFS(graph: GraphNodes<String>,source: String, destination: String) -> Bool {
        let nextToVisit = LinkedList<String>()
        var visited: Set<String> = Set()
        nextToVisit.append(value: source)
        
        while(nextToVisit.isNotEmpty()) {
            let node = nextToVisit.removeFirst()
            if  node == destination {
                globalPathArr.append(source)
                return true
            }
            
            if visited.contains(node) {
                continue
            }
            visited.insert(node)
            let adjacentValues = graph.getAdjecentValues(from: node)
            for child in adjacentValues {
                nextToVisit.append(value: child)
            }
        }
        return false
    }

    
    func add_directedToNode() {
        
    }
    
    func test_graphes() {
        let graph = GraphNodes<String>()
        let spiderMan = graph.createNode(data: "Spider Man")
        let ironMan = graph.createNode(data: "Iron Man")
        let captainAmerica = graph.createNode(data: "Captain America")
        let antMan = graph.createNode(data: "Ant Man")
        let civilWar = graph.createNode(data: "Civil War")
        let avengers = graph.createNode(data: "Avengers")
        let thor = graph.createNode(data: "Thor")
        let ragnarok = graph.createNode(data: "Ragnarok")
        let hulk = graph.createNode(data: "Hulk")
        
        // spiderman edges
        graph.addUndirectedEdge(between: spiderMan, and: ironMan)
        graph.addUndirectedEdge(between: spiderMan, and: civilWar)
        graph.addUndirectedEdge(between: spiderMan, and: avengers)

        // IronMan edges
        graph.addUndirectedEdge(between: ironMan, and: civilWar)
        graph.addUndirectedEdge(between: ironMan, and: avengers)

        // CaptinAmerica edges
        graph.addUndirectedEdge(between: captainAmerica, and: civilWar)
        graph.addUndirectedEdge(between: captainAmerica, and: avengers)
        
        // Antman
        // CaptinAmerica edges
        graph.addUndirectedEdge(between: antMan, and: civilWar)
        graph.addUndirectedEdge(between: antMan, and: avengers)
        graph.addUndirectedEdge(between: antMan, and: captainAmerica)
        
        // Thor
        graph.addUndirectedEdge(between: thor, and: avengers)
        graph.addUndirectedEdge(between: thor, and: ragnarok)
        
        // Hulk
        graph.addUndirectedEdge(between: hulk, and: ragnarok)
        graph.addDirectedEdge(from: hulk, to: avengers) //(between: , and: avengers)
        
//        print(graph.edges(from: spiderMan))
    }
}

fileprivate struct Node<T> {
    var data: T
    var index: Int
}

fileprivate struct Edge<T> {
    fileprivate let source: Node<T>
    fileprivate let destination: Node<T>
}

fileprivate enum EdgeType {
    case directed
    case undirected
}

extension Node: Hashable where T: Hashable {}
extension Node: Equatable where T: Equatable {}

//The CustomStringConvertible protocol allows us to define a custom output. We are going to use it to print index and data of Vertex.
extension Node: CustomStringConvertible {
    var description: String {
        return "\(index):\(data)"
    }
}

fileprivate protocol Graph {
    associatedtype Element //This allows the protocol to be generic, to hold any type.
    // associated type not used in the conforming class it exist to let the conforming class use generic type
    
    func createNode(data: Element) -> Node<Element>
    func addDirectedEdge(from source: Node<Element>, to destination: Node<Element>)
    func addUndirectedEdge(between source: Node<Element>, and destination: Node<Element>)
    
    func add(edgeType: EdgeType, from source: Node<Element>, to destination: Node<Element>) // add(_:from:to) provides a utility to get an edge between two vertices,
    
    func edges(from source: Node<Element>) -> [Edge<Element>] // edges(from:) provides a utility to retrieve all the edges that source vertex connects to
}

class GraphNodes <T: Hashable>: Graph {
    
    private var adjancencies: [Node<T>: [Edge<T>]] = [:]
    var adjecent = LinkedList<T>()

    init() {}
    
    fileprivate func createNode(data: T) -> Node<T> {

        let vertex = Node(data: data, index: adjancencies.count)
        adjancencies[vertex] = []
        return vertex
        
    }
    
    fileprivate func getNode(data: T) -> Node<T>? {
        for (node, _) in adjancencies {
            if node.data == data {
                return node
            }
        }
        return nil
    }
    
    fileprivate func addDirectedEdge(from source: Node<T>, to destination: Node<T>) {
        
        let edge = Edge(source: source, destination: destination)
        adjancencies[source]?.append(edge)
        
    }
    
    fileprivate func addUndirectedEdge(between source: Node<T>, and destination: Node<T>) {
        addDirectedEdge(from: source, to: destination)
        addDirectedEdge(from: destination, to: source)
    }
    
    fileprivate func add(edgeType edge: EdgeType, from source: Node<T>, to destination: Node<T>) {
        
        switch edge {
        case .directed:
            addDirectedEdge(from: source, to: destination)
        case .undirected:
            addUndirectedEdge(between: source, and: destination)
        }
    }
    
    fileprivate func edges(from source: Node<T>) -> [Edge<T>] {
        return adjancencies[source] ?? []
    }
    
    fileprivate func getAdjecentValues(from source: T) -> [T] {
        guard let node = getNode(data: source) else { return [] }
        let edges = edges(from: node)
                
        var destinations = [T]()
        for edge in edges {
            destinations.append(edge.destination.data)
        }
        return destinations
    }
    
}

extension GraphNodes: CustomStringConvertible {
    public var description: String {
        var result = ""
        for (node, edges) in adjancencies { // 1
            var edgeString = ""
            for (index, edge) in edges.enumerated() { // 2
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            result.append("\(node) ---> [ \(edgeString) ]\n") // 3
        }
        return result
    }
    
}
