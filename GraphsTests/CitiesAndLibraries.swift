//
//  CitiesAndLibraries.swift
//  GraphsTests
//
//  Created by mustafa salah eldin on 12/9/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

// https://www.hackerrank.com/challenges/torque-and-development/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=graphs

class CitiesAndLibraries: XCTestCase {
    
    func test_connections() {
//        let e1 = [[1,3], [3, 4], [2, 4], [1, 2], [2, 3], [5, 6]]
//        let e2 = [[1, 2], [3, 1], [2, 3]]
//
////        let roadsBuildingProbability = e1 // [[1,3], [2,3], [1,2], [2,7], [5,6], [6,8], [5,9]]
//        let cost1 = roadsAndLibraries(n: 3, c_lib: 2, c_road: 5, cities: e1)
//        let cost2 = roadsAndLibraries(n: 2, c_lib: 2, c_road: 1, cities: e2)
//
//        XCTAssertEqual(cost1, 12)
//        XCTAssertEqual(cost2, 4)

        let cities1 = [[8,2], [2,9]]
        let cities2 = [[2,1], [5,3], [5,1], [3,4], [3,1], [5,4], [4,1], [5,2], [4,2]]
        let cities3 = [[6,4], [3,2], [7,1]]
        let cost1 = roadsAndLibraries(n: 9, c_lib: 91, c_road: 84, cities: cities1)
        let cost2 = roadsAndLibraries(n: 5, c_lib: 92, c_road: 23, cities: cities2)
        let cost3 = roadsAndLibraries(n: 8, c_lib: 10, c_road: 55, cities: cities3)
        let cost4 = roadsAndLibraries(n: 1, c_lib: 5, c_road: 3, cities: [[]])
        let cost5 = roadsAndLibraries(n: 2, c_lib: 102, c_road: 1, cities: [[]])
        XCTAssertEqual(cost1, 805)
        XCTAssertEqual(cost2, 184)
        XCTAssertEqual(cost3, 80)
        XCTAssertEqual(cost4, 5)
        XCTAssertEqual(cost5, 204)

        /* Runtime Error => Input
         5
         9 2 91 84
         8 2
         2 9
         5 9 92 23
         2 1
         5 3
         5 1
         3 4
         3 1
         5 4
         4 1
         5 2
         4 2
         8 3 10 55
         6 4
         3 2
         7 1
         1 0 5 3
         2 0 102 1
         */
        
        /* Expected:
         805
         184
         80
         5
         204
         */
    }
    
    // Todo:  connecting a vertex with more than two vertices make inifinte looop
    
    // The target is to make sure that every city citizens can reach
    // -> So I should make sure that every city contains a lib or connected to a city that has lib
    
    // we need minimum cost => means It's a greedy algorithm
    
    // Starting state =>
    // 1- There is no Built libs
    // 2- There are no any connection between cities
    // 3- Just (BiDirectional Roads) could be built
    
    // Citizen has access to the library if
    // 1- City contains a library
    // 2- If there is a road from his city to a city contains a lib
    
    /* Example
     c_road = 2
     c_lib = 3
     cities = [[1,7], [1,3], [1,2], [2,3], [5,6], [6,8]]
     
     // in this case we have (depending on the connection ability between cities )
     We will build 5 roads to connect between all the cities = 5 * 2 = 10
     we will build 2 lib because the cities not all connected = 2 * 3 = 6
     So the total cost will be 10 + 6 = 16
     
     // one road from 1 -> 2 -> 3-> 1 is not necessary because without building a road from 3 to 1 we can reach from 3 to 1 through 2. The requirement of the problem not mention that we need a direct road between citiies but we Just need to reach from one to another
     //
     
     
     */
    
    /*
     Analysis
     
     - If I have many cities lets say 3 so how can I know that I don't need to build 3 roads Just 2 roads sufficent
     If I checked when I wanted to build a road from 3 to one, check If I have access from 3 to one
     // hasAccess
     // hasAccess means that the point check from Its connected points If they contain a path to the desired one -> in this case 3 will check if 2 contains the node 1
     // How to build the roads -> Loop through the [[first,last]]
     1- if there's no vertex for one of them we create It and connect to the second one because If the node not found before so It has no any other paths
     2- If It already exist -> and we need to connect the first with the last we check if any of them contains a path to each other
     
     3- If 2 * c_lib < c_road -> Build libraries every where
     
     */
    
    
    
    func roadsAndLibraries(n: Int, c_lib: Int, c_road: Int, cities: [[Int]]) -> Int {
        // loop through cities
        if cities.first?.count == 0 {
            return c_lib * n
        }
        var numberOfRoadsBuilt = 0
        var citiesIds = Set<Int>()
        var graph = DefaultDirectedGraph<Int>()
        for twoCitites in cities { // must be
            let firstCity = twoCitites.first!
            let secondCity = twoCitites.last!
            citiesIds.insert(firstCity)
            citiesIds.insert(secondCity)
            // Using setVertex if the vertex exist it won't create new one
            let firstCityVertex: Vertex<Int>! = graph.setVertex(data: firstCity, neighbours: [])
            let secondCityVertex: Vertex<Int>! = graph.setVertex(data: secondCity, neighbours: [])
            var visited = Set<Vertex<Int>>()
             if !graph.hasPath(src: firstCityVertex, dst: secondCityVertex, visited: &visited) {
                 numberOfRoadsBuilt += 1
                graph.connect(first: firstCityVertex, second: secondCityVertex, connectionType: .indirect)
            }
        }
        
        
        // Following approach of building more roads with center lib
        let costOfRoads = c_road  // we can get by getting the adjacencies for the max city
        let costOfLib = c_lib
        
        let verticesGreatestConnections = getVerticesThatHaveGreatestConnections(graph: graph)
        var costOfMoreRoads = numberOfRoadsBuilt * costOfRoads
        let costOfMoreLib = graph.vertices.keys.count * costOfLib
        for verticesGreatestConnection in verticesGreatestConnections {
//            costOfMoreRoads += (graph[verticesGreatestConnection]?.count ?? 1) * costOfRoads
            costOfMoreRoads += 1 * costOfLib
            debugPrint("has more connecetions \(verticesGreatestConnection.data)")
        }
        
        var result = costOfMoreRoads > costOfMoreLib ? costOfMoreLib : costOfMoreRoads
        
        if c_lib * 2 < c_road {
            result = costOfMoreLib
        }
        
        if citiesIds.count < n {
            result += c_lib * (n - citiesIds.count)
        }
        
        
        debugPrint("The cost is lib \(costOfMoreLib) roads \(costOfMoreRoads)")
        return result
    }
    
    func getVerticesThatHaveGreatestConnections<G: DirectedGraph>(graph: G) -> [Vertex<Int>] where G.E == Int {
        let disConnectedGraph = graph.getNumberOfConnectedComponents()
        let graphComponentsRootVertices = disConnectedGraph.disconnectedComponentsVertices
        var disconnectedVertices = [[Vertex<Int>]]()
        var maxConnectionsVertices = [Vertex<Int>]()
        for vertex in graphComponentsRootVertices {
            disconnectedVertices.append(graph.getAllConnectedVerticesIn(source: vertex))
        }
        
        for disconnectedList in disconnectedVertices {
            var maxInConnected = 0
            var maxVertex: Vertex<Int>!
            for vertex in disconnectedList {
                if (graph[vertex]?.count ?? 0) > maxInConnected {
                    maxInConnected = graph[vertex]?.count ?? 0
                    maxVertex = vertex
                }
            }
            maxConnectionsVertices.append(maxVertex)
        }
        return maxConnectionsVertices
    }
    
}
