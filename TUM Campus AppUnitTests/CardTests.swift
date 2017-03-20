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
//    var cardDataItems: [DataElement]?
    var viewController: CardViewController!
    
    
    override func setUp() {
        super.setUp()
        // ToDo: Only call before ALL tests, not in setUp (which is called before EVERY test)
        let storyboard = UIStoryboard(name: "CardView",
                                      bundle: Bundle.main)
        viewController = storyboard.instantiateInitialViewController() as! CardViewController
        viewController.preloadView()
        // The ViewController requests the manager from the TabBar at the end of viewDidLoad. We override it so it's not nil
        viewController.manager = self.manager // ToDo: Inject manager properly
        viewController.viewWillAppear(false)
        while viewController.cards.count <= 1 { // There is a card saying "You have no cards", in case there are no "real" cards
            viewController.manager = self.manager // ToDo: Inject manager properly
            sleep(2) // Busy wait until the cards are loaded
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCardViewInit() {
        let cardView = self.viewController.view
        XCTAssertNotNil(cardView, "ViewController view is not nil");
    }
    
    func testUpcomingMovieCardIsShown() {
        func receiveData(_ data: [DataElement], expectation: XCTestExpectation) {
            let movies = data.flatMap { $0 as? Movie }
            let visibleCells = self.viewController.tableView.visibleCells
            let movieCell = self.viewController.tableView.dequeueReusableCell(withIdentifier: "film") as? CardTableViewCell
            if movies.isEmpty {
                XCTAssertNil(movieCell)
                
                // mit cellIdentifier: "film"
//                visibleCells.filter(
//                    {
//                        (cell) -> Bool in
//                        //Comparing the Second Int value of tuple in filter
//                        if cell > 3 {
//                            return true
//                        } else {
//                            return false
//                        }
//                        
//                })
                // Check that there is no Movie in tha card set of the ViewController
//                let movieCardItems = viewController.cards.flatMap { $0 as? Movie }
//                XCTAssert(movieCardItems.count == 0)
            } else {
                // Check that the movie card displays the next upcoming movie
                let dateNow = Date()
                let upcomingMovies = movies.filter { $0.airDate >= dateNow }
                let sortedUpcomingMovies = upcomingMovies.sorted(by: { $0.airDate < $1.airDate })
                let nextMovie = sortedUpcomingMovies[0]
//                XCTAssert(movieCell.LABELXXX.text == nextMovie.name)
                
            }
            expectation.fulfill()
        }
        
        let expect = expectation(description: "Movie card displays the next upcoming movie or is not shown")
        let tmpReceiver = MockReceiver(receiveData: receiveData, expectation: expect)
        
        manager.getMovies(tmpReceiver)
        waitForExpectations(timeout: 5) { error in
            // No specific failing is required here
        }
    }
}

extension UIViewController {
    // Preload view, so loadView and didLoadView are called
    func preloadView() {
        let _ = view
    }
}
