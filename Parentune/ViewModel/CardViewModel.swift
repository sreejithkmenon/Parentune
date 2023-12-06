//
//  CardViewModel.swift
//  Parentune
//
//  Created by Sreejith K Menon on 05/12/23.
//

import Foundation

/// `CardViewModel` is a class responsible for managing and providing the view's data related to a collection of card items.
/// It conforms to `ObservableObject` to provide observable properties that a view can subscribe to.
class CardViewModel: ObservableObject {
    
    /// The array of `CardItem` objects that the view displays. It's marked with `@Published` to notify observers of changes.
    @Published var cardItems = [CardItem]()
    
    /// A Boolean value indicating whether the data is being loaded. It's used to show/hide a loading indicator in the view.
    @Published var isLoading: Bool = false
    
    /// An optional String used to store and display error messages when a fetch operation fails.
    @Published var errorMessage: String? = nil
    
    /// The service used to fetch card data, conforming to `APIServiceProtocol`. It allows for dependency injection.
    let service: APIServiceProtocol
    
    /// Initializes the `CardViewModel` with an `APIServiceProtocol` instance.
    /// - Parameter service: An object conforming to `APIServiceProtocol`. Defaults to `APIService()`.
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchCards()
    }
    
    /// Fetches card items using the service and updates the view model properties accordingly.
    func fetchCards() {
        isLoading = true
        errorMessage = nil
        
        // Creates a URL object using the URL string from `AppConstants`.
        let url = URL(string: AppConstants.URLs.getCardsURL)
        
        // Calls the `fetchCards` method on the service and handles the result.
        service.fetchCards(url: url) { [unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .success(let cardItems):
                    self.cardItems = cardItems
                }
            }
        }
    }
    
    /// Creates a `CardViewModel` instance in an error state for testing or demonstration purposes.
    /// - Returns: An instance of `CardViewModel` with a preset error message.
    static func errorState() -> CardViewModel {
        let fetcher = CardViewModel()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    /// Creates a `CardViewModel` instance in a success state with example data for testing or demonstration purposes.
    /// - Returns: An instance of `CardViewModel` with preset example card items.
    static func successState() -> CardViewModel {
        let fetcher = CardViewModel()
        fetcher.cardItems = [CardItem.example1(), CardItem.example2()]
        return fetcher
    }
}
