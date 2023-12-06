//
//  APIError.swift
//  Parentune
//
//  Created by Sreejith K Menon on 05/12/23.
//

import Foundation

// Define an enumeration `APIError` that conforms to the `Error` and `CustomStringConvertible` protocols.
// This enum is used to represent various errors that can occur while interacting with an API.
enum APIError: Error, CustomStringConvertible {
    // Enum cases representing different types of errors:
    case badURL // Represents an error due to an invalid URL.
    case badResponse(statusCode: Int) // Represents a bad response from the server, with an associated status code.
    case url(URLError?) // Represents an error related to the URL session, optionally holding a URLError.
    case parsing(DecodingError?) // Represents an error in parsing the response, optionally holding a DecodingError.
    case unknown // Represents an unknown error.
    
    // A computed property to provide a user-friendly error message.
    var localizedDescription: String {
        switch self {
        case .badURL, .parsing, .unknown:
            return "Sorry, something went wrong." // Generic error message for these cases.
        case .badResponse(_):
            return "Sorry, the connection to our server failed." // Error message for bad server response.
        case .url(let error):
            return error?.localizedDescription ?? "Something went wrong." // Specific error message from URLError, if available.
        }
    }
    
    // A computed property to describe the error. This is part of the `CustomStringConvertible` protocol.
    var description: String {
        switch self {
        case .unknown:
            return "unknown error" // Description for unknown error.
        case .badURL:
            return "invalid URL" // Description for invalid URL error.
        case .url(let error):
            return error?.localizedDescription ?? "url session error" // Description from URLError, if available.
        case .parsing(let error):
            return "parsing error \(error?.localizedDescription ?? "")" // Description for parsing error, including details from DecodingError if available.
        case .badResponse(statusCode: let statusCode):
            return "bad response with status code \(statusCode)" // Description for bad response error, including the status code.
        }
    }
}

