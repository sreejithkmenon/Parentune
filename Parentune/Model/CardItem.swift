//
//  CardItem.swift
//  Parentune
//
//  Created by Sreejith K Menon on 05/12/23.
//

import Foundation

/// `CardItem` is a struct representing a card-like data item. It conforms to `Codable` for encoding and decoding from external representations (like JSON), and `Hashable` for use in collections like `Set` or as `Dictionary` keys.
struct CardItem: Codable, Hashable {
    // MARK: - Properties
    var card_id: Int       // Unique identifier for the card item.
    var type: String?      // Type of the card (e.g., audio, text), optional.
    var audio_url: String? // URL string for the audio content, if applicable.
    var title: String?     // Title of the card item, optional.
    var label: String?     // Label for the card, may be used for categorization or display purposes, optional.
    var text: String?      // Text content of the card, if applicable, optional.
    var video_id: String?  // Identifier for a video, if applicable, optional.
    
    /// Initializes a new `CardItem` with provided details.
    /// - Parameters:
    ///   - card_id: A unique identifier for the card.
    ///   - type: The type of content the card represents (e.g., audio, video).
    ///   - audio_url: The URL of the audio content, if applicable.
    ///   - title: The title of the card.
    ///   - label: A label for the card.
    ///   - text: The text content of the card.
    ///   - video_id: An identifier for a video, if applicable.
    init(card_id: Int, type: String, audio_url: String, title: String, label: String, text: String, video_id: String) {
        self.card_id = card_id
        self.type = type
        self.audio_url = audio_url
        self.title = title
        self.label = label
        self.text = text
        self.video_id = video_id
    }
    
    /// Initializes a new `CardItem` from a decoder. This initializer is used for decoding the object from an external representation (like JSON).
    /// - Parameter decoder: The decoder to read data from.
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        card_id = try values.decode(Int.self, forKey: .card_id)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        label = try values.decodeIfPresent(String.self, forKey: .label)
        text = try values.decodeIfPresent(String.self, forKey: .text)
        video_id = try values.decodeIfPresent(String.self, forKey: .video_id)
    }
    
    /// Coding keys to map the properties of `CardItem` to and from an external representation.
    enum CodingKeys: String, CodingKey {
        case card_id
        case type
        case audio_url
        case title
        case label
        case text
        case video_id
    }
    
    // MARK: - Example Instances
    /// Provides an example `CardItem` for demonstration or testing purposes.
    static func example1() -> CardItem {
        return CardItem(card_id: 5, type: "audio", audio_url: "https://v1.cdnpk.net/videvo_files/audio/premium/audio0108/watermarked/HUMAN-WHISTLE_GEN-HDF-15500_preview.mp3", title: "Halloween is around the corner. Here are few things to get ahead of", label: "get ahead", text: "", video_id: "")
    }
    
    /// Provides another example `CardItem` for demonstration or testing purposes.
    static func example2() -> CardItem {
        return CardItem(card_id: 4, type: "opt_text", audio_url: "https://v1.cdnpk.net/videvo_files/audio/premium/audio0108/watermarked/HUMAN-WHISTLE_GEN-HDF-15500_preview.mp3", title: "A Mantra when nothing is working to clam your child", label: "", text: "Lorem ipsum description Lorem ipsum description Lorem ipsum description Lorem ipsum description Lorem ipsum description", video_id: "")
    }
}
