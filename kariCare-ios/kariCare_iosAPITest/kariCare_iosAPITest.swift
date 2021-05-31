//
//  kariCare_iosAPITest.swift
//  kariCare_iosAPITest
//
//  Created by akhigbe benjamin on 28/05/2021.
//

import XCTest
@testable import kariCare_ios

class kariCare_iosAPITest: XCTestCase {

     var sut: URLSession!
     
     override func setUpWithError() throws {
         super.setUp()
         sut = URLSession(configuration: .default)
     }
     
     override func tearDownWithError() throws {
         sut = nil
         super.tearDown()
     }
     
     func testAPICall() throws {
        page1Request()
        page2Request()
        page3Request()
     }
    
    func page1Request(){
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        let dataTask = sut.dataTask(with:URL(string: Constants.ApiServiceUrl.page1)!) { data, response, error in
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
    
    func page2Request(){
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        let dataTask = sut.dataTask(with:URL(string: Constants.ApiServiceUrl.page2)!) { data, response, error in
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
    
    func page3Request(){
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        let dataTask = sut.dataTask(with:URL(string: Constants.ApiServiceUrl.page3)!) { data, response, error in
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
