//
//  NetworkingManager.swift
//  SwiftfulCrypto
//
//  Created by omar nasser on 28/12/2022.
//

import Foundation
import Combine
class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String?{
            switch self {
            case .badURLResponse(url: let url): return "[🔥] Bad response from URL. \(url)"
            case .unknown: return "[⚠️]Unkown error occured"
            }
        }
    }
   
    static func download(url: URL) -> AnyPublisher<Data, any Error> {
      return  URLSession.shared.dataTaskPublisher(for: url)
        .subscribe(on: DispatchQueue.global(qos: .default))
        .tryMap({ try handleURLResponse(output: $0,url: url)})
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
        
    
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output,url:URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)
        }
//        print("Status code: \(response.statusCode)")
  
        return output.data
    }
    
    
    static func handelCompletion(completion: Subscribers.Completion<Error>){
        switch completion {
        case .finished:
            break
        case .failure(let error):
     
            print("error: \(error.localizedDescription)")
        }
    }
    
}
