//
//  __1BlurEffectsTests.swift
//  1.1BlurEffectsTests
//
//  Created by John Regner on 7/14/15.
//  Copyright © 2015 johnregner. All rights reserved.
//

import XCTest

class __1BlurEffectsTests: XCTestCase {
    
    override func setUp() {
        let observer = Observer()
        XCTestObservationCenter.sharedTestObservationCenter().addTestObserver(observer)
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}

class Observer : NSObject, XCTestObservation {
    func testBundleWillStart(testBundle: NSBundle) {
        print("JR Test Bundle \(testBundle) is starting")
    }
    func testBundleDidFinish(testBundle: NSBundle) {
        print("JR Test bundle \(testBundle) Did Finish")
    }
    func testSuiteWillStart(testSuite: XCTestSuite) {
        print("JR Test Suite \(testSuite) is starting")
    }
    func testSuite(testSuite: XCTestSuite, didFailWithDescription description: String, inFile filePath: String?, atLine lineNumber: UInt) {
        print("JR Suite \(testSuite), failed a \(filePath):\(lineNumber)")
    }
    func testSuiteDidFinish(testSuite: XCTestSuite) {
        print("JR Suite \(testSuite) Finished")
    }
    func testCaseWillStart(testCase: XCTestCase) {
        print("JR Starting case \(testCase)")
    }
    func testCase(testCase: XCTestCase, didFailWithDescription description: String, inFile filePath: String?, atLine lineNumber: UInt) {
        print("JR Case \(testCase) FAILED \(filePath):\(lineNumber)")
    }
    func testCaseDidFinish(testCase: XCTestCase) {
        print("JR Case \(testCase) Finished")
    }
}
