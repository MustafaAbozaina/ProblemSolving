//
//  UBSTests.swift
//  AlgoLab150Problems
//
//  Created by Mustafa Abozaina on 20/02/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//

import XCTest


class UBSTests: XCTestCase {
    
    
    func test() {
        let mynum: MyEnum? = .none
        switch mynum {
            
        case nil: print("nil")
            
        case .some(.none): print("non")
            
        }
    }
    
    func test_expe() {
        let exp = expectation(description: "jhell")
        getAuthorHistory(author: "epaga")
        waitForExpectations(timeout: 5)
//        XCTAssertEqual(getAuthorHistory(author: "epaga"), [""])
//        let a: (any XCProtocol)? = methodHash(elements: ASE())
    }
}

enum MyEnum {
    case none
}

//func methodHash<T: Hashable>(elements: T) -> T {
//
//}

protocol XCProtocol: Hashable {
    
}

struct ASE: XCProtocol {
    
}
struct RootModel<T: Codable>: Codable {
    var page: Int?
    var per_page: Int?
    var total: Int?
    var total_pages: Int?
    var data: T?
}

struct Article: Codable {
var id: Int?
var title: String?
var story_title: String?
var url: String?
var author: String?
var num_comments: Int?
var story_id: Int?
var story_url: String?
var parent_id: Int?
var created_at: Int?
}

let group = DispatchGroup()
//group.enter()  // move this line to before your dataTask

func getAuthorHistory(author: String) -> [String] {
    // Write your code here
  
    group.enter()
    var history = [String]()
       var articles = [Article]()
    loadData(author: author, page: 1, output: { (out: [Article]) in
        articles.append(contentsOf: out)
    })
             
    group.wait()
//
//    // request the user
//    // save the data field
//    // history.p
//    let baseUrl = "https://jsonmock.hackerrank.com/api/"
////    let urlPath = "article_users"
//    let authorUrl = "articles?author=\(author)"
//    let userUrl = "article_users?username=\(author)"
//    let urlPath = "articles?author=\(author)"
//    let baa = "https://jsonmock.hackerrank.com/api/article_users?username=\(author)"
//    let networkManger = NetworkManager(session:URLSession.shared , baseUrl: baseUrl)
//    var page = 1
//    let parameters = ["author": author, "page": page] as [String : Any]
//    networkManger.loadData(urlPath: urlPath, restMethod: .get, parameters: parameters) { (data: RootModel<[Article]>?) in
//        articles.append(contentsOf: data?.data ?? [])
////        history.append(data?.data?.ti ?? "")
//        if (data?.data?.count ?? 0) < (data?.per_page ?? 0) || (data?.total_pages == data?.page){
//            group.leave()
//        } else {
//            page += 1
//
//        }
//    } failure: { (failure: NetworkFailure<FailureResponse>) in
//
//    }
   
    for article in articles {
        let articleName: String = article.title ?? article.story_title ?? ""
        if !articleName.isEmpty {
            history.append(articleName)
        }
        
    }
    return history
}

func loadData(author: String, page: Int, output: @escaping ([Article]) -> Void) {
    let baseUrl = "https://jsonmock.hackerrank.com/api/"
    let urlPath = "articles?author=\(author)"
    let networkManger = NetworkManager(session:URLSession.shared , baseUrl: baseUrl)
    let parameters = ["author": author, "page": page] as [String : Any]
    networkManger.loadData(urlPath: urlPath, restMethod: .get, parameters: parameters) { (data: RootModel<[Article]>?) in
        output(data?.data ?? [])
        if (data?.data?.count ?? 0) < (data?.per_page ?? 0) || (data?.total_pages == data?.page){
            group.leave()
        } else {
            loadData(author: author, page: page + 1) { articles in
                output(articles)
            }
        }
    } failure: { (failure: NetworkFailure<FailureResponse>) in
        
    }
    
}


extension JSONDecoder {
    func decode<T: Decodable>(responseData: Data) -> T? {
        do {
            let responseModel = try self.decode(T.self, from: responseData)
            return responseModel
        } catch (let error) {
            debugPrint("Error decoding object \(T.self) with error \(error)")
            return nil
        }
    }
}

class NetworkManager: HTTPClient {
    private var session: URLSession
    private var baseUrl: String
    private var headers: [String: String]?
    private var jsonDecoder: JSONDecoder = JSONDecoder()
    
    init(session: URLSession, baseUrl: String = "https://pastebin.com/raw/", headers: [String: String]? = nil) {
        self.session = session
        self.baseUrl = baseUrl
        self.headers = headers
    }

    func loadData<T: Codable, F: Codable>(urlPath: String, restMethod: RestMethod, parameters: [String: Any]?, success: @escaping (T)-> (), failure: @escaping (NetworkFailure<F>)-> ()) {
        let fullUrl = baseUrl + urlPath
        guard let urlRequest = buildRequest(urlPath: fullUrl, httpMethod: restMethod, parameters: parameters, headers: headers) else {return }
        
        self.session.dataTask(with: urlRequest) { data, response, error in
            if let _ = error {
                failure(.init(failureModel: nil, error: .generalError))
                return
            }
            
            self.handleResult(data: data, response: response as? HTTPURLResponse, success: success, failure: failure)
            
        }.resume()
    }
    
    private func handleResult<T: Codable, F: Codable>(data: Data?, response: HTTPURLResponse?, success: @escaping (T)-> Void, failure: (NetworkFailure<F>)-> Void) {
        var statusCodeFailure = false
        guard let data = data, let response = response else {
            failure(.init(failureModel: nil, error: .responseFailureStatusCode, stausCode: response?.statusCode ))

            return
        }

            if response.statusCode > 299 || response.statusCode < 200  {
                statusCodeFailure = true
        }
        
        if (statusCodeFailure) {
            failure(self.buildFailureModel(data: data, response: response))
        }
        else {
            if let successModel: T = self.decodeDataToModel(data: data) {
                success(successModel)
            } else {
                failure(.init(failureModel: nil, error: .failedToMapDataToModel, stausCode: response.statusCode))
            }
            
        }
    }
    
    private func buildFailureModel<F: Codable>(data: Data, response: URLResponse) -> NetworkFailure<F> {
        let failureResponse: F? = self.decodeDataToModel(data: data)
            var errorType: NetworkError = .responseFailureStatusCode
                if failureResponse == nil {
                    errorType = .failedToMapDataToModel
                }
        let statusCode = (response as? HTTPURLResponse)?.statusCode
             return .init(failureModel: failureResponse, error: errorType, stausCode: statusCode)
    }
        
    private func decodeDataToModel<T: Codable>(data: Data) -> T? {
        let decodedValue: T? = self.jsonDecoder.decode(responseData: data)
        return decodedValue
    }
    
}

// MARK: Helpers
extension NetworkManager {
    private func buildRequest(urlPath: String, httpMethod: RestMethod, parameters: [String: Any]?, headers: [String: String]? = nil) -> URLRequest? {
        guard let url = buildURL(urlPath: urlPath, parameters: parameters) else {return nil}

        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        if let unwrappedHeaders = headers {
            for (key, value) in unwrappedHeaders {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }

        return request
    }
    
    private func buildURL(urlPath: String, parameters: [String: Any]?) -> URL? {
        var urlComponents = URLComponents(string: urlPath)
        urlComponents?.queryItems = buildQueryParameters(parameters: parameters)
        
        return urlComponents?.url
    }
    
    private func buildQueryParameters(parameters: [String: Any]?) -> [URLQueryItem]? {
        guard let parameters = parameters else {
            return nil
        }
        var queryParamters: [URLQueryItem] = []
        for (key, value) in parameters {
            queryParamters.append(URLQueryItem(name: "\(key)", value: "\(value)") )
        }
        
        return queryParamters
    }

}

enum RestMethod: String {
    case get = "GET"
    case post = "POST"
}

enum NetworkError: Int, Error {
    case generalError
    case responseFailureStatusCode
    case failedToMapDataToModel
}

struct NetworkFailure<F: Codable> {
    var failureModel: F?
    var error: NetworkError
    var stausCode: Int?
}

struct FailureResponse: Codable {
    
}

protocol HTTPClient {
    func loadData<T: Codable, F: Codable>(urlPath: String, restMethod: RestMethod, parameters: [String: Any]?, success: @escaping (T)-> (), failure: @escaping (NetworkFailure<F>)-> ())
}
