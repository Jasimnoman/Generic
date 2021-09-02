//
//  GenericTests.swift
//  GenericTests
//
//  Created by Jahan on 03/09/2021.
//

import XCTest
@testable import Generic

class GenericTests: XCTestCase {
    
    var sut: URLSession!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = URLSession(configuration: .default)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testMostViewedApi() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testValidApiCallGetsHTTPStatusCode200() throws {
        try XCTSkipUnless(
            Reachability.isConnectedToNetwork(),
            "Network connectivity needed for this test.")
        // given
        let urlString = Constants.BaseUrl + "\(Constants.EndPonts.mostViewed)\(Constants.days).json?api-key=\(Constants.apiKey)"
        let url = URL(string: urlString)!
        // 1
        let promise = expectation(description: "Status code: 200")
        
        // when
        let dataTask = sut.dataTask(with: url) { _, response, error in
            // then
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    // 2
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        // 3
        wait(for: [promise], timeout: 5)
    }
    
    func testApiCallCompletes() throws {
        try XCTSkipUnless(
            Reachability.isConnectedToNetwork(),
            "Network connectivity needed for this test.")
        // given
        let urlString = Constants.BaseUrl + "\(Constants.EndPonts.mostViewed)\(Constants.days).json?api-key=\(Constants.apiKey)"
        let url = URL(string: urlString)!
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        // when
        let dataTask = sut.dataTask(with: url) { _, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)
        
        // then
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
}
