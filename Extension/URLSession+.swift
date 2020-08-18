//
//  URLSession+.swift
//
//  Created by Tom on 2019/6/20.
//

import Foundation

extension URLSession {
    func dataTask(with request: URLRequest, result: @escaping (Result<(Data, URLResponse), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: request) { (data, response, error) in
            if let error = error {
                result(.failure(error))
            }
            
            guard let response = response,
                let data = data else {
                    let error = NSError(domain: "", code: 0, userInfo: nil)
                    result(.failure(error))
                    return
            }
            
            result(.success((data, response)))
        }
    }
    
    func dataTask(with url: URL, result: @escaping (Result<(Data, URLResponse), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: url) { (data, response, error) in
            if let error = error {
                result(.failure(error))
            }
            
            guard let response = response,
                let data = data else {
                    let error = NSError(domain: "", code: 0, userInfo: nil)
                    result(.failure(error))
                    return
            }
            
            result(.success((data, response)))
        }
    }
}
