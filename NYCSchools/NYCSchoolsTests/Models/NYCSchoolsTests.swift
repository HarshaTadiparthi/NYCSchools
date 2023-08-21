//
//  NYCSchoolsTests.swift
//  NYCSchoolsTests
//
//  Created by Harshavardhan Tadiparthi on 18/08/23.
//

import XCTest

class NYCSchoolsTests: XCTestCase {
    
    //MARK: - Variables
    var schools: [SchoolsListResponseModel]!
    
    //MARK: - Setup
    override func setUp() {
        super.setUp()
    }

    //MARK: - Tests
    func testSchoolsListModel() {
        let schools:[SchoolsListResponseModel] = MockFileLoader.readDataFromFile(at: "schools_mock_data")
        XCTAssertNotNil(schools, "schools list should not be nil.")
        XCTAssertEqual(schools[0].schoolName, "Clinton School Writers & Artists, M.S. 260", "school names should be equal.")
        XCTAssertEqual(schools[0].dbn, "02M260", "School DBNs should be equal.")

    }

    //MARK: - Tear down
    override func tearDown() {
        super.tearDown()
    }
}
