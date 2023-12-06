//
//  CardListView.swift
//  Parentune
//
//  Created by Sreejith K Menon on 05/12/23.
//

import SwiftUI

/// `CardListView` is a SwiftUI view that presents a list of `CardItem` objects.
/// It uses a two-column grid layout to display the cards.
struct CardListView: View {
    
    // An array of `CardItem` objects that the view will display.
    let cards: [CardItem]
    
    // Defines a two-column grid layout. Each column is flexible, meaning
    // it adjusts to the available space.
    private let twoColumnGrid = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // The body of the `CardListView`. It defines the view hierarchy and layout.
    var body: some View {
        // A vertical stack that aligns its children vertically.
        VStack {
            // A navigation stack to manage the navigation of views.
            NavigationStack {
                // A scroll view allowing the content to be scrolled.
                ScrollView {
                    // A lazy vertical grid that creates views on demand from an underlying
                    // collection of identified data, arranged in the specified columns.
                    LazyVGrid(columns: twoColumnGrid) {
                        // Loops over the `cards` array and creates a view for each `card`.
                        ForEach(cards, id: \.self) { card in
                            CardItemView(card: card)
                        }
                    }
                    .padding(.leading, 20) // Adds left padding to the grid.
                    .padding(.trailing, 20) // Adds right padding to the grid.
                }
                .navigationTitle(AppConstants.App.appName) // Sets the navigation bar title.
            }
        }
        .background(Color.init(hex: AppConstants.UIUtils.cardListViewBGHexColor)) // Sets the background color.
    }
}

/// A preview provider for `CardListView`.
/// This provides design-time data for SwiftUI previews in Xcode.
struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView(cards: CardViewModel.successState().cardItems)
    }
}

