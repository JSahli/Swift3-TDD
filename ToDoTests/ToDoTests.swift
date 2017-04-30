//
//  ToDoTests.swift
//  ToDoTests
//
//  Created by Jesse Sahli on 4/13/17.
//  Copyright © 2017 JS. All rights reserved.
//

import XCTest
@testable import ToDo

class ToDoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Init_WhenGivenTitle_SetsTitle(){
        let item = ToDoItem(title: "Foo")
        XCTAssertEqual(item.title, "Foo", "Should set title")
    }
    
    func test_Init_WhenGivenDescription_SetsDescription(){
        let item = ToDoItem(title: "", description: "Bar")
        XCTAssertEqual(item.description, "Bar", "Should set description")
    }
    
    func test_Init_WhenGivenTimeStamp_SetsTimeStamp(){
        let item = ToDoItem(title: "", timestamp:0.0)
        XCTAssertEqual(item.timestamp, 0.0, "Should set timestamp")
    }
    
    func test_Init_WhenGivenLocation_SetsLocation(){
        let location = Location(name: "Foo")
        let item = ToDoItem(title: "", location: location)
        XCTAssertEqual(item.location?.name, "Foo", "Should set location")
    }
    
    func test_EqualItems_AreEqual(){
        let item1 = ToDoItem(title: "Foo")
        let item2 = ToDoItem(title: "Foo")
        XCTAssertEqual(item1, item2)
    }
    
    func test_Items_WhenLocationDiffers_AreNotEqual(){
        let item1 = ToDoItem(title: "", location: Location(name: "Foo"))
        let item2 = ToDoItem(title: "", location: Location(name: "Bar"))
        XCTAssertNotEqual(item1, item2)
    }
    
    func test_WhenOneHasLocationAndOtherDoesnt_AreNotEqual() {
        let item1 = ToDoItem(title: "Foo", location: Location(name: "Foo"))
        let item2 = ToDoItem(title: "Foo", location: nil)
        XCTAssertNotEqual(item1, item2)
    }
    
    func test_Items_WhenTimeStampDiffers_AreNotEqual() {
        let item1 = ToDoItem(title: "Foo", timestamp: 1.0)
        let item2 = ToDoItem(title: "Foo", timestamp: 0.0)
        XCTAssertNotEqual(item1, item2)
    }
    
    func test_Items_WhenDescriptionDiffers_AreNotEqual() {
        let item1 = ToDoItem(title: "Foo", description: "This is a description")
        let item2 = ToDoItem(title: "Foo", description: "Fleeb")
        XCTAssertNotEqual(item1, item2)
    }
    
    func test_Items_WhenTitleDiffers_AreNotEqual() {
        let item1 = ToDoItem(title: "Foo")
        let item2 = ToDoItem(title: "Bar")
        XCTAssertNotEqual(item1, item2)
    }
    
    
    
}


















