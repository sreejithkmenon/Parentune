//
//  Cards.swift
//  Parentune
//
//  Created by Sreejith K Menon on 05/12/23.
//

import Foundation

/// `Cards` is a structure that represents a collection of `CardItem` objects.
/// It conforms to `Codable`, which allows it to be encoded and decoded from and to JSON (or other formats).
struct Cards: Codable {
    
    /// An array of `CardItem` objects representing the individual cards.
    var cardItems: [CardItem]
    
    /// Initializes a new `Cards` instance from a decoder.
    /// This initializer is used for decoding a `Cards` instance from a data format (like JSON).
    /// - Parameter decoder: The decoder to use for decoding the `Cards` data.
    /// - Throws: An error if decoding fails.
    init(from decoder: Decoder) throws {
        // Define the keys used for decoding based on the `CodingKeys` enum.
        let values = try decoder.container(keyedBy: CodingKeys.self)
        // Decode the array of `CardItem` from the decoder.
        cardItems = try values.decode([CardItem].self, forKey: .cardItems)
    }
    
    /// Initializes a new `Cards` instance with a given array of `CardItem`.
    /// This initializer can be used when creating a `Cards` object directly in code.
    /// - Parameter cardItems: An array of `CardItem` objects to initialize the `Cards` instance with.
    init(cardItems: [CardItem]) {
        self.cardItems = cardItems
    }
    
    /// `CodingKeys` is an enumeration that conforms to `CodingKey` protocol.
    /// It is used to define the keys that match the JSON structure for encoding and decoding.
    /// In this case, it maps the `cardItems` property to a JSON key named "cards".
    enum CodingKeys: String, CodingKey {
        case cardItems = "cards"
    }
}
