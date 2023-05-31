//
//  ArtSearchUITests.swift
//  ArtSearchUITests
//
//  Created by Jared on 5/31/23.
//

import Foundation
import XCTest

@testable import ArtSearch

final class ArtSearchUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
        sleep(2)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSplashScreenFinishes() throws {
        let splashScreenText = app.staticTexts["ArtSearch"]
        let splashScreenIcon = app.images["SplashScreenIcon"]
        
        XCTAssertFalse(splashScreenText.exists)
        XCTAssertFalse(splashScreenIcon.exists)
    }
    
    func testFeaturedListLoads() throws {
        let featuredText = app.staticTexts["Featured"]
        let button = app.buttons["Starry Night and the Astronauts, Alma Thomas"]
        let titleText = app.staticTexts["Starry Night and the Astronauts"]
        
        XCTAssert(featuredText.exists)
        
        button.tap()
        
        XCTAssert(titleText.exists)
    }
    
    func testGenreListLoads() throws {
        let genreButton = app.buttons["Genres"]
        let genreTitle = app.staticTexts["All Genres"]
        let genreBadges = app.buttons.matching(identifier: "genreBadge")
        
        genreButton.tap()
        
        XCTAssert(genreTitle.exists)            // View title
        XCTAssertEqual(genreBadges.count, 9)    // Tests that all 9 genres in Genre enum are shown
    }
    
    func testInfoViewLoads() throws {
        let infoButton = app.buttons["About"]
        let infoText = app.staticTexts["About"]
        
        infoButton.tap()
        
        XCTAssert(infoText.exists)
    }
    
    func testSearchSheetAppears() throws {
        let searchButton = app.buttons["Search"]
        let searchResultsText = app.staticTexts["Results:"]
        
        searchButton.tap()
        
        XCTAssert(searchResultsText.exists)
    }
    
    func testSearchReturnsExpectedResults() throws {
        let searchTabButton = app.buttons["Search"]
        let searchTextField = app.textFields["Search"]
        let searchButton = app.buttons["Done"]
        let expectedArtistText = app.staticTexts["Henri de Toulouse-Lautrec"]
        
        searchTabButton.tap()
        searchTextField.tap()
        searchTextField.typeText("Toulouse-Lautrec")
        searchButton.tap()
        
        sleep(3)
        
        XCTAssert(expectedArtistText.exists)
    }
}
