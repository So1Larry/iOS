//  TUM_Campus_AppUnitTests.swift
//  TUM Campus AppUnitTests
//
//  Created by Max Muth on 10/03/2017.
//  Copyright © 2017 LS1 TUM. All rights reserved.
//

import XCTest
import UIKit

@testable import Campus

//class CardManagerTests: XCTestCase {
//    var manager = TumDataManager(user: nil)
//    var cardDataItems: [DataElement]?
//
//    override func setUp() {
//        super.setUp()
//        manager.getCardItems(self)
//        sleep(5)
//    }
//
//    override func tearDown() {
//        super.tearDown()
//    }
//
//    func testMovieCardIsShown() {
//        XCTAssert(self.cardDataItems?.count == 42)
//    }
//}
//
//extension CardManagerTests: TumDataReceiver {
//    func receiveData(_ data: [DataElement]) {
//        self.cardDataItems = data
//    }
//}

class CardTests: XCTestCase {
    var manager = TumDataManager(user: nil)
    var cardDataItems: [DataElement]?
    var viewController: CardViewController!
    
    override func setUp() {
        super.setUp()
        func receiveData(_ data: [DataElement], expectation: XCTestExpectation) { expectation.fulfill() }
        let expect = expectation(description: "SetUp: Receiving all card data items")
        let tmpReceiver = MockReceiver(receiveData: receiveData, expectation: expect)
        manager.getCardItems(tmpReceiver)
        waitForExpectations(timeout: 5)
        
        let storyboard = UIStoryboard(name: "CardView",
                                      bundle: Bundle.main)
        viewController = storyboard.instantiateInitialViewController() as! CardViewController
        
//        UIApplication.shared.keyWindow!.rootViewController = viewController
        
//        navigationController.preloadView()
        viewController.preloadView()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
        func testCardViewInit() {
            let cardView = self.viewController.view
            XCTAssertNotNil(cardView, "Cannot find cardView instance");
        }
    
//    func testMovieCardIsShown() {
//        XCTAssert(self.cardDataItems?.count == 42)
//    }
}

extension UIViewController {
    func preloadView() {
        let _ = view
    }
}


//class CardViewControllerTests: XCTestCase {
//    var viewController: CardViewController!
//
//    override func setUp() {
//        super.setUp()
//
//        let storyboard = UIStoryboard(name: "CardView",
//                                      bundle: Bundle.main)
//        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
//        viewController = navigationController.topViewController as! CardViewController
//
//        UIApplication.shared.keyWindow!.rootViewController = viewController
//
//        navigationController.preloadView()
//        viewController.preloadView()
//    }
//
//    func testCardViewIsNotNil() {
//        let cardView = self.viewController.view
//        XCTAssertNotNil(cardView, "Cannot find cardView instance");
//    }
//
//    override func tearDown() {
//        super.tearDown()
//    }
//}
