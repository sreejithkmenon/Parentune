//
//  ErrorView.swift
//  Parentune
//
//  Created by Sreejith K Menon on 05/12/23.
//

import SwiftUI

// ErrorView is a SwiftUI View responsible for presenting error messages to the user.
// It makes use of a `CardViewModel`, assumed to be a ViewModel that handles the logic
// related to fetching and managing a set of "cards" (data entities), possibly for a card-based UI.
struct ErrorView: View {
    
    // ObservedObject property wrapper indicates that this view should re-render
    // whenever the `cardViewModel` publishes changes, such as an updated error message.
    @ObservedObject var cardViewModel = CardViewModel()
    
    // The body property describes the view's content and layout.
    var body: some View {
        VStack {
            // Display the application name at the top of the view.
            Text(AppConstants.App.appName)
                .font(.largeTitle)
                .bold()
                .padding()
            
            // Conditionally display an error message if one exists in the ViewModel.
            if let errorMessage = cardViewModel.errorMessage {
                Text(errorMessage)
                    .padding()
            }
            
            // Button to retry fetching cards. It calls a function in the ViewModel.
            Button {
                cardViewModel.fetchCards()
            } label: {
                Text(AppConstants.ErrorMessage.tryAgainMessage)
            }
            .padding()
        }
    }
}

// PreviewProvider for SwiftUI previews in Xcode.
// This struct provides a preview of the ErrorView in Xcode's canvas or the preview pane.
struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
