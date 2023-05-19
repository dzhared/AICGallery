//
//  AICGalleryUITests.swift
//  AICGalleryUITests
//
//  Created by Jared on 4/1/23.
//

import XCTest

@testable import AICGallery

final class AICGalleryUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
        sleep(3)
    }

    override func tearDownWithError() throws {
        //
    }

    func testSplashScreenLoads() throws {
        let splashScreenText = app.staticTexts["Art Institute of Chicago"]
        
        XCTAssertFalse(splashScreenText.exists)
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
        
        XCTAssert(genreTitle.exists)
        XCTAssertEqual(genreBadges.count, 9)
    }
    
    func testInfoViewLoads() throws {
        let infoButton = app.buttons["About"]
        let infoText = app.staticTexts["About"]
        
        infoButton.tap()
        
        XCTAssert(infoText.exists)
    }
}
