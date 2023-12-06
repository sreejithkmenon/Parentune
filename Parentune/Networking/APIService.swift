//
//  APIService.swift
//  Parentune
//
//  Created by Sreejith K Menon on 05/12/23.
//

import Foundation
import SwiftUI

/// `APIService` conforms to the `APIServiceProtocol`. It provides methods to fetch data from a URL and decode it into a specified `Decodable` type.
struct APIService: APIServiceProtocol {
    
    /// Fetches data from a given URL and decodes it into the specified `Decodable` type.
    /// - Parameters:
    ///   - type: The `Decodable` type to which the fetched data should be decoded.
    ///   - url: The URL from which to fetch data. If `nil`, the method returns an `APIError.badURL` error.
    ///   - completion: A closure that gets called with the result of the fetch operation. It returns a `Result` containing either the fetched data or an `APIError`.
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T, APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        // Creates a data task to fetch data from the URL.
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handles networking and parsing errors and returns appropriate API errors.
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(type, from: data)
                    completion(Result.success(result))
                } catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }
        
        task.resume()
    }
    
    /// Fetches data from a given URL and decodes it into an array of `CardItem`.
    /// - Parameters:
    ///   - url: The URL from which to fetch data. If `nil`, the method returns an `APIError.badURL` error.
    ///   - completion: A closure that gets called with the result of the fetch operation. It returns a `Result` containing either an array of `CardItem` or an `APIError`.
    func fetchCards(url: URL?, completion: @escaping(Result<[CardItem], APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        // Creates a data task specifically for fetching and decoding an array of `CardItem`.
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let cards = try decoder.decode(Cards.self, from: data)
                    completion(Result.success(cards.cardItems))
                } catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }
        
        task.resume()
    }
}
