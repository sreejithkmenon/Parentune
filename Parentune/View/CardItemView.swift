//
//  CardItemView.swift
//  Parentune
//
//  Created by Sreejith K Menon on 05/12/23.
//

import SwiftUI

// Represents a view for displaying a card item in a SwiftUI application.
struct CardItemView: View {
    
    // The `CardItem` model representing the data for this view.
    // Assumption: `CardItem` is a custom model defined elsewhere with optional `title` and `text` properties.
    let card: CardItem
    
    var body: some View {
        VStack(alignment: .leading) {
            // Conditionally displays the title if it's present.
            // The title is styled as `title2` font, bold, and padded.
            if let title = card.title {
                Text(title)
                    .font(.title2)
                    .bold()
                    .padding()
            }
            
            // Conditionally displays additional text if it's present.
            // The text is styled as `title3` font and padded.
            if let text = card.text {
                Text(text)
                    .font(.title3)
                    .padding()
            }
            
            // Spacer to push content to the top of the card.
            Spacer()
        }
        // Styling of the card view.
        .frame(height: 400) // Fixed height of 400 points.
        .frame(minWidth: 0, maxWidth: .infinity) // Expands to the maximum width available.
        .background(Color.white) // White background for the card.
        .cornerRadius(15) // Rounded corners with a radius of 15.
        .padding(.all, 15) // Padding around the card.
        .shadow(color: .gray, radius: 5, x: 5, y: 5) // Drop shadow for a 3D effect.
    }
}

// Provides a preview of the `CardItemView`.
struct CardItemView_Previews: PreviewProvider {
    static var previews: some View {
        // Example usage of `CardItemView` with an example card item.
        // Assumption: `CardItem.example1()` is a static method that returns an example `CardItem` instance.
        CardItemView(card: CardItem.example1())
            .previewLayout(.fixed(width: 400, height: 200)) // Fixed preview layout size.
    }
}
