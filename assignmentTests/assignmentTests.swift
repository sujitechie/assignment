//
//  assignmentTests.swift
//  assignmentTests
//
//  Created by Sujith Peeka on 27/04/20.
//  Copyright © 2020 Sujith Peeka. All rights reserved.
//

import XCTest
@testable import assignment

class AssignmentTests: XCTestCase {
    private let dataFactory = DataFactory()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSuccessfulImageDownload() {
        let validIUrl = "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"
        let expectation = self.expectation(description: "downloading image")
        dataFactory.downloadImageFromURL(imageUrl: validIUrl) { (image, error) in
            XCTAssertNil(error)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFailureImageDownload() {
         let validIUrl = "http://files.turbosquid.com/Preview/Content_2009_07_14__10_25_15/trebucheta.jpgdf3f3bf4-935d-40ff-84b2-6ce718a327a9Larger.jpg"
         let expectation = self.expectation(description: "downloading image")
         dataFactory.downloadImageFromURL(imageUrl: validIUrl) { (image, error) in
             XCTAssertNil(image)
             XCTAssertNotNil(error)
             expectation.fulfill()
         }
         waitForExpectations(timeout: 5, handler: nil)
     }
    
    func testSuccessfulFactsFetch() {
        let validUrl = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        let expectation = self.expectation(description: "downloading data")
        dataFactory.getFacts(url: validUrl) { (data, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(data)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testFailureFactsFetch() {
        let inValidUrl = "https://dl.dropboxusercontent.com/s//facts.json"
        let expectation = self.expectation(description: "downloading data")
        dataFactory.getFacts(url: inValidUrl) { (data, error) in
            XCTAssertNil(data)
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
}
