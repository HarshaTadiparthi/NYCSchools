//
//  SchoolsListViewModelTests.swift
//  NYCSchoolsTests
//
//  Created by Harshavardhan Tadiparthi on 18/08/23.
//

import XCTest

class SchoolsListViewModelTests: XCTestCase {
    
    //MARK: - Variables
    var sut: SchoolsListViewModel!
    var apiManager: MockDataManager<[SchoolsListResponseModel]>!
    
    //MARK: - Setup
    override func setUp() {
        super.setUp()
        apiManager = MockDataManager()
        sut = SchoolsListViewModel(apiManager: apiManager)
    }
    
    //MARK: - Tests
    func testFetchSchoolsList() {
        
        let expectation = XCTestExpectation(description: "Fetch schools list Data ")
        let emptyModel =  SchoolsListResponseModel()
        apiManager.model = [emptyModel]
        
        sut.fetchSchoolsList() { result in
            if result != false {expectation.fulfill()}
        }
        XCTAssertTrue(apiManager.isDataFetched, "Data should be fetched")
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testSuccessfulFetchschoolsList() {
        let schoolsList: [SchoolsListResponseModel] = MockFileLoader.readDataFromFile(at: "schools_mock_data")
        apiManager.model = schoolsList
        let expectation = XCTestExpectation(description: "Reload tableView triggered")
        sut.fetchSchoolsList(){ status in
            if status == true { expectation.fulfill() }
        }
        XCTAssertTrue(apiManager.isDataFetched, "Data should be fetched")
        wait(for: [expectation], timeout: 1.0)
    }
        
    func testSchoolsListDataModel() {
        let schoolsList: [SchoolsListResponseModel] = MockFileLoader.readDataFromFile(at: "schools_mock_data")
        let schoolname = schoolsList[0].schoolName ?? ""
        XCTAssertEqual(schoolname, "Clinton School Writers & Artists, M.S. 260", "Both school names should be equal.")
    }
    
    //MARK: - Tear down
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
}

