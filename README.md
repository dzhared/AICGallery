#  Art Institute of Chicago Gallery

##  About

This app is a virtual gallery of art retrieved from the Art Institute of Chicago's digital collection.

Using the app is simple: just open the app and browse either the currently featured artwork or by genre. Categories are laid out clearly in the All Genres tab on the bottom tab bar.

Information about each work can be seen by tapping on an individual work. These are inspired by placards in the actual museum and include descriptive text.

To run the app, simply clone the git repository, open the Xcode project and press Run.

I have no affiliation with the AIC. (But it's a great museum!)

##  Process

This app was written in Swift 5.7, built using SwiftUI, targeting iOS 15.6 and above.

Photos are loaded by calling the API, decoding the retrieved JSON into structs, then using its data to retrieve an AsyncImage to populate images in a beautiful layout. Images are requested in lower resolution to load faster and use fewer resources.

Tests are included as a means to test search functionality, response time, accuracy and more. The app requires internet connection to work, but includes a button to retry if loading fails. VStacks are used rather than LazyVStacks to reduce data usage with minimal impact on memory usage, and to prevent images from unloading in case network connection is lost.

I created the logo and app icon in Adobe Illustrator.

### Resources Used

Art Institute of Chicago API: https://api.artic.edu/docs

quicktype for JSON parsing: https://app.quicktype.io

Postman for API simplifying API searches: https://www.postman.com

##  Screenshots

![Simulator Screenshot - iPhone 14 Pro - 2023-04-03 at 23 18 40](https://user-images.githubusercontent.com/25894006/229686475-f7827bcb-61fa-4f6d-9240-b79bba627d9b.png)
![Simulator Screenshot - iPhone 14 Pro - 2023-04-03 at 23 18 48](https://user-images.githubusercontent.com/25894006/229686499-1b4b2726-968e-4f0f-b6ec-375480eee1ae.png)
![Simulator Screenshot - iPhone 14 Pro - 2023-04-03 at 23 18 57](https://user-images.githubusercontent.com/25894006/229686506-0bdc73d7-e6c5-451b-826b-7372c3261bfa.png)


##  Accessibility

### Alt Text
Alt text is provided for all artwork and as accessibility labels for screen readers.

### Dynamic Type Support
All text is formatted to support every possible font size using Dynamic Type on iOS

### Dark Mode
Dark Mode is fully supported with no impact on legibility or visibility.

### Reduce Transparency
Translucent labels are partially overlaid on the artworks' badges, but enabling Reduce Transparency in iOS's Accessibility settings will make them opaque for additional legibility. 

##  License Information

The Art Institute of Chicago API is licensed under the [GNU Affero General Public License Version 3](https://github.com/art-institute-of-chicago/data-aggregator/blob/develop/LICENSE).

The data in all responses is licensed under a Creative Commons Zero (CC0) 1.0 designation and the Terms and Conditions of [artic.edu](https://artic.edu/terms).
