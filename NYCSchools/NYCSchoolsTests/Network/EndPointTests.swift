//
//  EndPointTests.swift
//  NYCSchoolsTests
//
//  Created by Harshavardhan Tadiparthi on 18/08/23.
//

import XCTest
@testable import NYCSchools

class EndPointTests: XCTestCase {
    
    //MARK: - Variables
    var sut: EndPoint!
    
    //MARK: - Setup
    override func setUp() {
        super.setUp()
        sut = EndPoint.baseURL
    }
    
    //MARK: - Tests
    func testSuccessfulError() {
        sut = EndPoint.baseURL
        XCTAssertNotNil(sut.rawValue, "Base URL should be there.")
        sut = EndPoint.schoolsList
        XCTAssertNotNil(sut.rawValue, "schoolsList should be there.")
        sut = EndPoint.satScores
        XCTAssertNotNil(sut.rawValue, "satScores should be there.")
        
    }
        
        
        func testFailureError() {
            sut = EndPoint.baseURL
            XCTAssertNotEqual(sut.rawValue, "empty", "Base URL shouldn't be empty.")
            sut = EndPoint.schoolsList
            XCTAssertNotEqual(sut.rawValue, "empty", "Schols List shouldn't be empty.")
            sut = EndPoint.satScores
            XCTAssertNotEqual(sut.rawValue, "empty", "SatScores shouldn't be empty.")
            
        }
        
        //MARK: - Teardown
        override func tearDown() {
            super.tearDown()
            sut = nil
        }
    }
    
