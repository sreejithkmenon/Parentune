# Parentune

## Introduction
Parentune is a mobile application developed for Good Inside, designed to present Dr. Becky's content in a format of easy-to-digest "cards". This project is part of my application for the "Mobile Engineer - Flutter" role at Good Inside.

## Setup
To set up the project in your local environment, follow these steps:
1. Clone the repository to your machine.
2. Open `Parentune.xcodeproj` in Xcode.
3. Ensure you have all the required dependencies installed.
4. Build and run the project using Xcode.

## Exercise Description
The purpose of this project was to build Good Inside's first mobile application. This app visualizes data from the provided endpoint: [Good Inside Cards API](https://bff.goodinside.dev/api/p/cards). Each card contains an ID, type, and may include a title, text, label, audio, or video in short-form format. The app is designed to request and display these cards in a clear and distinguishable manner.

## Project Structure
The project follows a structured approach with clear separation of concerns:

- **Assets.xcassets:** Contains all the app assets including app icons and color sets.
- **Constants:** Holds the `AppConstants.swift` file for global constants.
- **Extensions:** Includes `ColorExtension.swift` for custom color extensions.
- **Model:** Contains data models like `CardItem.swift` and `Cards.swift`.
- **Networking:** Manages API interactions including services and protocols.
- **View:** UI components of the app like `CardItemView.swift`, `CardListView.swift`, etc.
- **ViewModel:** Contains `CardViewModel.swift` managing the data for views.

Refer to the detailed project structure in the repository for more information.

## Usage
The app fetches data from the Good Inside API and displays it in the form of cards. Each card is designed to show its content in an easily digestible format. The UI is kept simple to focus on functionality and data presentation.

## Screenshots
[![temp-Imageiu0ii-H.jpg](https://i.postimg.cc/TY4JXfV9/temp-Imageiu0ii-H.jpg)](https://postimg.cc/YhQW6cyG)

