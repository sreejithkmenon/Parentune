//
//  AppConstants.swift
//  Parentune
//
//  Created by Sreejith K Menon on 05/12/23.
//

import Foundation

/// `AppConstants` is a struct used to encapsulate various constants used throughout the application.
/// It follows a structured format, dividing constants into related sub-structures for better organization and readability.
struct AppConstants {

    /// The `App` structure contains constants related to the application itself.
    struct App {
        /// The name of the application.
        static let appName = "Parentune"
    }
    
    /// The `ErrorMessage` structure contains constants for error messages that can be used throughout the application.
    struct ErrorMessage {
        /// A general error message to be displayed when an operation needs to be retried.
        static let tryAgainMessage = "Try again"
    }
    
    /// The `URLs` structure contains various URL constants used for network requests within the application.
    struct URLs {
        /// The URL used for fetching card data.
        static let getCardsURL = "https://bff.goodinside.dev/api/p/cards"
    }
    
    /// The `UIUtils` structure contains constants related to the User Interface utilities, like colors and styles.
    struct UIUtils {
        /// The background hex color code for the card list view.
        static let cardListViewBGHexColor = "EEEEEE"
    }
}
