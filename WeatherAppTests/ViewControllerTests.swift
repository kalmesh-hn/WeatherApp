//
//  ViewControllerTests.swift
//  WeatherAppTests
//

//  Copyright © 2020 Kalmesh. All rights reserved.
//

import XCTest
@testable import WeatherApp
import Cuckoo
import Bond

class ViewControllerTests: XCTestCase {

    var viewController: ViewController!
    let mockedViewModel = MockWeatherViewModelProtocol()
    let weatherDetails = [WeatherCellDetail.sample()]

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        stub(mockedViewModel) { stub in
            when(stub.showAlert.get).thenReturn(Observable<UIAlertController?>(nil))
            when(stub.showLoader.get).thenReturn(Observable<Bool>(false))
            when(stub.viewLoaded()).thenDoNothing()
            
            when(stub.weatherDetails.get).thenReturn(Observable<[WeatherCellDetail]?>(weatherDetails))
        }
        viewController = ViewController.instantiate(viewModel: mockedViewModel)
        _ = viewController.view
        viewController.loadView()
    }

    func testNumberOfItemsInDataSource() throws {
        _ = mockedViewModel.weatherDetails.observeNext { value in
            if value != nil {
                XCTAssert(value?.count == self.weatherDetails.count, "View Model not built properly")
                let rows = self.viewController.tableView(self.viewController.tableView, numberOfRowsInSection: 0)
                XCTAssert( rows == self.weatherDetails.count, "DataSource should have correct number of rows")
            }
        }
    }
    
    func testTemperatureValue() throws {
        _ = mockedViewModel.weatherDetails.observeNext { value in
            if value != nil {
                XCTAssert(value?.first?.detailValue == WeatherCellDetail.sample().detailValue, "View Model not sending the correct temperature")
                let rows = self.viewController.tableView(self.viewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
                XCTAssert( rows.textLabel?.text == WeatherCellDetail.sample().detailKey, "Screen showing incorrect weather info")
            }
        }
    }

}

extension WeatherCellDetail {
    static func sample() -> WeatherCellDetail {
        return WeatherCellDetail("temp", "5.45")
    }
}
