//
//  APIMockService.swift
//  Parentune
//
//  Created by Sreejith K Menon on 05/12/23.
//

import Foundation

/// A mock service for simulating API calls in a testing environment.
/// This service implements the `APIServiceProtocol` and is used to provide predefined
/// responses to API requests, allowing for consistent and controlled testing conditions.
struct APIMockService: APIServiceProtocol {
    
    // The predefined result to be returned when the `fetchCards` method is called.
    // This can be a success with an array of `CardItem` or a failure with an `APIError`.
    // This allows for testing both successful and erroneous responses from the API.
    var resultCards: Result<[CardItem], APIError>
    
    /// Fetches card items from the API.
    /// In this mock implementation, it does not perform an actual network request,
    /// but instead returns the predefined `resultCards`.
    ///
    /// - Parameters:
    ///   - url: The URL for the API request. In this mock implementation, the URL is not used.
    ///         However, it is included to match the protocol requirements and to allow for
    ///         flexibility in future implementations or extensions of the mock service.
    ///   - completion: A closure that is called with the result of the fetch operation.
    ///                 The closure takes a `Result` type parameterized by an array of `CardItem`
    ///                 and an `APIError`. This closure is executed with the predefined
    ///                 `resultCards` value.
    ///
    /// - Note: In a real API service, the URL would be used to construct the network request.
    ///         However, in this mock implementation, the URL is ignored, and the predefined
    ///         result is returned immediately. This is a common approach in unit testing
    ///         where actual network calls are avoided for consistency and speed.
    func fetchCards(url: URL?, completion: @escaping (Result<[CardItem], APIError>) -> Void) {
        completion(resultCards)
    }
}
