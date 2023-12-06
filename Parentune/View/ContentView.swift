//
//  ContentView.swift
//  Parentune
//
//  Created by Sreejith K Menon on 05/12/23.
//

import SwiftUI

// ContentView: A SwiftUI view that displays different content based on the state of the CardViewModel.
struct ContentView: View {
    
    // @StateObject var cardViewModel: An instance of CardViewModel, observed for any state changes.
    // It's assumed that CardViewModel conforms to ObservableObject and publishes changes to its properties.
    @StateObject var cardViewModel = CardViewModel()
    
    // body: The view's body, which builds the UI.
    var body: some View {
        VStack {
            // Display LoadingView if the cardViewModel is in a loading state.
            // LoadingView is assumed to be a view that represents a loading indicator or a similar UI element.
            if cardViewModel.isLoading {
                LoadingView()
            }
            
            // Display ErrorView if there is an error message in cardViewModel.
            // ErrorView is assumed to be a view that takes a CardViewModel and presents error information.
            // It's also assumed that ErrorView can handle the user interaction to possibly rectify the error or navigate away.
            else if cardViewModel.errorMessage != nil  {
                ErrorView(cardViewModel: cardViewModel)
            }
            
            // Display CardListView with the list of cards from cardViewModel if neither loading nor error state is present.
            // CardListView is assumed to be a view that takes an array of card items and displays them in a list format.
            // Each card item is assumed to conform to a data structure that CardListView can interpret and display.
            else {
                CardListView(cards: cardViewModel.cardItems)
            }
        }
    }
}

// ContentView_Previews: A preview provider for ContentView.
// This is a standard SwiftUI preview provider, and it's assumed that it provides a realistic preview of the ContentView in the Xcode canvas.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

