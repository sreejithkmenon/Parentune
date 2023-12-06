//
//  LoadingView.swift
//  Parentune
//
//  Created by Sreejith K Menon on 05/12/23.
//

import SwiftUI

/// `LoadingView` is a SwiftUI View component that displays a loading indicator.
///
/// This view is typically used in scenarios where an asynchronous task is in progress,
/// such as fetching data from a network or performing a long-running computation.
/// It uses the `ProgressView` component from SwiftUI to show a standard loading spinner.
///
/// Usage:
/// ```
/// LoadingView()
/// ```
///
/// - Important: This view does not handle the loading logic itself. It is purely a UI
///   component and requires the parent view or the view model to control its visibility
///   based on the loading state of the relevant task.
struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20)  {
            // The `ProgressView` is a built-in SwiftUI component that displays a
            // circular loading spinner. It automatically adapts to the current
            // platform and appearance settings (like Dark Mode).
            ProgressView()
        }
        // VStack alignment and spacing can be adjusted as needed based on the
        // design requirements. Currently, it centers the `ProgressView` and
        // provides a vertical spacing of 20 points.
    }
}

/// `LoadingView_Previews` is a part of SwiftUI's Preview Provider system.
///
/// This struct provides a preview of the `LoadingView` in Xcode's canvas and
/// allows for quick visual testing during development. The preview is only
/// compiled and visible in Xcode and does not affect the application's runtime.
///
/// - Note: Always ensure to provide previews for custom views to leverage
///   SwiftUI's live preview capabilities, enhancing the development workflow.
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        // Provides a preview of `LoadingView`.
        // You can add more previews with different states or properties if needed
        // to test various scenarios.
        LoadingView()
    }
}

