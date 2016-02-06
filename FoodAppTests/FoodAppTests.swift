//
//  FoodAppTests.swift
//  FoodAppTests
//
//  Created by Emmanuel Cuevas on 2/5/16.
//  Copyright © 2016 Emmanuel Cuevas. All rights reserved.
//

import XCTest
@testable import FoodApp

class FoodAppTests: XCTestCase {
    
    //Mark: FoodApp Tests
    
    //Test to confirm that the Meal initializer returns when no name or a negative rating is provided.
    
    func testMealInitialization(){
        
        //Success case.
        let potentialItem = Meal(name: "Newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        //Failure cases.
        let noName = Meal (name: "", photo: nil, rating: 0)
        XCTAssertNotNil(noName, "Empty name is valid")
        
        let badRating = Meal(name: "Really bad rating", photo: nil, rating: -1)
        XCTAssertNotNil(badRating,"Negative ratins are invalid, be possitive")
        
    }
    
    override func setUp() {
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
