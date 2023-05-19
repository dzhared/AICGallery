//
//  AICGalleryUnitTests.swift
//  AICGalleryUnitTests
//
//  Created by Jared on 3/30/23.
//

import XCTest

@testable import AICGallery

final class AICGalleryUnitTests: XCTestCase {
    
    func testNumberArtworksRetrieved() throws {
        // Test that limit given in GET request returns correct number artworks
        let expectedNumber = 20
        var retrievedArtworks = [Artwork]()
        let expectation = XCTestExpectation(description: "\(retrievedArtworks.count) of \(expectedNumber) retrieved")
        
        for genre in Genres.allCases {
            getArtworks(for: genre.rawValue, limit: expectedNumber) { artworks in
                retrievedArtworks = artworks
                XCTAssertEqual(expectedNumber, retrievedArtworks.count)
                print("Retrieving artworks for \(genre.rawValue)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testArtStylesMatch() throws {
        // Tests that retrieved artworks match art style queried
        let genre = "Modern Art"
        var matchedArtworks = 0
        var totalArtworks = 0
        let expectation = XCTestExpectation(description: "Retrieved artworks")
        
        getArtworks(for: genre, limit: 20) { artworks in
            for artwork in artworks {
                if artwork.departmentTitle == genre {
                    matchedArtworks += 1
                }
                totalArtworks += 1
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
        
        // 40% match accounts for Modern and Contemporary Arts' overlap
        let ratioMatch = Double(matchedArtworks)/Double(totalArtworks)
        print("Ratio match: \(ratioMatch.formatted(.percent))")
        
        XCTAssertGreaterThan(ratioMatch, 0.4)
    }
    
    func testArtworkMatch() throws {
        // Tests that an individual work matches top result in query
        let expectation = XCTestExpectation(description: "Artwork retrieved")
        let expectedArtwork = Artwork(id: 129884,
                                      title: "Starry Night and the Astronauts",
                                      artistTitle: "Alma Thomas",
                                      artistDisplay: "Alma Thomas\nAmerican, 1891–1978",
                                      dateDisplay: "1972",
                                      mediumDisplay: "Acrylic on canvas",
                                      imageId: "e966799b-97ee-1cc6-bd2f-a94b4b8bb8f9",
                                      thumbnail: Thumbnail(altText: ""),
                                      departmentTitle: "Contemporary Art")
        
        getArtworks(for: "Starry Night and the Astronauts", limit: 1) { artworks in
            let retrievedArtworks = artworks
            XCTAssertEqual(expectedArtwork.id, retrievedArtworks[0].id)
            XCTAssertEqual(expectedArtwork.title, retrievedArtworks[0].title)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testGetArtworksTime() throws {
        // Measure time getArtworks function takes to complete
        let genre = "Arts of Asia"
        let expectation = XCTestExpectation(description: "All artworks retrieved")
        let startTime = DispatchTime.now()
        
        getArtworks(for: genre, limit: 20) { artworks in
            let retrievedArtworks = artworks
            let endTime = DispatchTime.now()
            let totalTime = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
            print("Time to retrieve \(retrievedArtworks.count) artworks: \(Double(totalTime) / 1_000_000) ms")
            
            if !retrievedArtworks.isEmpty {
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5.0)
    }
    
}
