//
//  APIServiceProtocol.swift
//  Parentune
//
//  Created by Sreejith K Menon on 05/12/23.
//

import Foundation

/// Protocol `APIServiceProtocol` defines the requirements for an API service
/// that fetches data from a given URL.
///
/// It provides a method `fetchCards` to retrieve a collection of `CardItem` objects.
/// This protocol can be implemented by any class or struct that needs to perform API requests
/// to fetch card data.
///
/// - Assumptions:
///   - The URL provided is valid and points to a resource that returns data in the expected format.
///   - The `CardItem` type is already defined elsewhere in the project and conforms to `Decodable` for JSON decoding.
///   - `APIError` is an enumeration that handles different types of API errors and is defined elsewhere in the project.
protocol APIServiceProtocol {
    
    /// Fetches a collection of card items from a specified URL.
    ///
    /// - Parameters:
    ///   - url: An optional `URL` where the card data is located. If `nil`, the method might use a default URL.
    ///   - completion: A completion handler that is invoked when the fetch operation is completed.
    ///     It returns a `Result` type that either contains an array of `CardItem` on success
    ///     or an `APIError` on failure.
    ///
    /// - Note: The method is asynchronous and uses a completion handler to return the data.
    ///   The actual implementation should handle all networking tasks including error handling,
    ///   data parsing, and returning the result on the main thread if necessary.
    func fetchCards(url: URL?, completion: @escaping(Result<[CardItem], APIError>) -> Void)
    
}
