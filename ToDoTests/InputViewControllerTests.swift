//
//  InputViewControllerTests.swift
//  ToDo
//
//  Created by Jesse Sahli on 5/22/17.
//  Copyright © 2017 JS. All rights reserved.
//

import XCTest
import CoreLocation
@testable import ToDo

class InputViewControllerTests: XCTestCase {
    
    var sut: InputViewController!
    var placemark: MockPlacemark!
    
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "InputViewController") as! InputViewController
        _ = sut.view
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_HasTitleTextField() {
        XCTAssertNotNil(sut.titleTextField)
    }
    
    func test_HasDateTextField() {
        XCTAssertNotNil(sut.dateTextField)
    }
    
    func test_HasLocationTextField() {
        XCTAssertNotNil(sut.locationTextField)
    }
    
    func test_HasAddressTextField() {
        XCTAssertNotNil(sut.addressTextField)
    }
    
    func test_HasDescriptionTextField() {
        XCTAssertNotNil(sut.descriptionTextField)
    }
    
    func test_HasSaveButton() {
        XCTAssertNotNil(sut.saveButton)
    }
    
    func test_HasCancelButton() {
        XCTAssertNotNil(sut.cancelButton)
    }
    
    func test_Save_UsesGeocoderToGetCoordinateFromAddress() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let timestamp = 1456030800.0
        let date = Date(timeIntervalSince1970: timestamp)
        sut.titleTextField.text = "Foo"
        sut.dateTextField.text = dateFormatter.string(from: date)
        sut.locationTextField.text = "Bar"
        sut.addressTextField.text = "Infinite Loop 1, Cupertino"
        sut.descriptionTextField.text = "Baz"
        
        let mockGeocoder = MockGeocoder()
        sut.geocoder = mockGeocoder
        sut.itemManager = ItemManager()
        sut.save()
        
        placemark = MockPlacemark()
        let coordinate = CLLocationCoordinate2DMake(37.3316851,
                                                    -122.0300674)
        placemark.mockCoordinate = coordinate
        mockGeocoder.completionHandler?([placemark], nil)
        let item = sut.itemManager?.item(at: 0)
        let testItem = ToDoItem(title: "Foo",
                                description: "Baz",
                                timestamp: timestamp,
                                location: Location(name: "Bar", coordinate: coordinate))
        
        XCTAssertEqual(item, testItem)
    }
    
    
    func test_SaveButtonHasSaveAction() {
        let saveButton: UIButton = sut.saveButton
        
        
        guard let actions = saveButton.actions(
            forTarget: sut,
            forControlEvent: .touchUpInside) else {
                XCTFail(); return
        }
        
        
        XCTAssertTrue(actions.contains("save"))
    } 
    
}


extension InputViewControllerTests {
    class MockGeocoder: CLGeocoder {
        
        var completionHandler: CLGeocodeCompletionHandler?
        
        override func geocodeAddressString(
            _ addressString: String,
            completionHandler: @escaping CLGeocodeCompletionHandler) {
            self.completionHandler = completionHandler
        }
    }
}

class MockPlacemark : CLPlacemark {
    
    
    var mockCoordinate: CLLocationCoordinate2D?
    
    
    override var location: CLLocation? {
        guard let coordinate = mockCoordinate else
        { return CLLocation() }
        
        
        return CLLocation(latitude: coordinate.latitude,
                          longitude: coordinate.longitude)
    }
}




















