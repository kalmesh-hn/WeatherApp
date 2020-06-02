//
//  ViewModelTests.swift
//  WeatherAppTests
//

//  Copyright © 2020 Kalmesh. All rights reserved.
//

import XCTest
@testable import WeatherApp
import Cuckoo
import CoreLocation

class ViewModelTests: XCTestCase {
    
    let mockedNetworkLayer = MockNetworkClientProtocol()
    let mockedLocationManagerLayer = MockLocationManagerProtocol()
    var viewModel: WeatherViewModel!
    let someLocation = CLLocation(latitude: 5.45, longitude: 0.809)
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        stub(mockedNetworkLayer) { stub in
            when(stub.getWeatherDetails(latitude: any(), longitude: any(), completion: anyClosure())).then { latitude, longitude, completion in
                completion(.success(.sample()))
            }
        }
        
        stub(mockedLocationManagerLayer) { stub in
            when(stub.locationDelegate.get).thenReturn(viewModel)
            when(stub.locationDelegate.set(any())).thenDoNothing()
            when(stub.requestLocalAuthorization()).then {
                self.viewModel.didDetectLocation(location: self.someLocation, error: nil)
            }
        }
        
        self.viewModel = WeatherViewModel(networkClient: mockedNetworkLayer, locationManager: mockedLocationManagerLayer)

    }
    
    func testLocationInvocation() {
        viewModel.viewLoaded()
        verify(mockedLocationManagerLayer, atLeastOnce()).requestLocalAuthorization()
    }
    
    func testViewModelContents() {
        viewModel.viewLoaded()
        viewModel.didDetectLocation(location: someLocation, error: nil)
        verify(mockedLocationManagerLayer, atLeastOnce()).requestLocalAuthorization()
        _ = viewModel.weatherDetails.observeNext { value in
            if value != nil {
                XCTAssert(value?.count == 7, "View Model not built properly")
            }
        }
    }

    func testViewModelTemperature() {
        viewModel.viewLoaded()
        viewModel.didDetectLocation(location: someLocation, error: nil)
        verify(mockedLocationManagerLayer, atLeastOnce()).requestLocalAuthorization()
        _ = viewModel.weatherDetails.observeNext { value in
            if value != nil {
                let temp = value?[2].detailValue
                XCTAssert(temp == String(WeatherInfo.sample().currently.temperature), "Incorrect temperature passed to ViewController")
            }
        }
    }
    //Likewise, test for other weather details too
    
    func testLocationError() {
        viewModel.didDetectLocation(location: nil, error: nil)
        _ = viewModel.showAlert.observeNext { value in
            if value != nil {
                XCTAssert(value?.title == "Failure", "Should show error alert on screen")
            }
        }
    }

}

extension WeatherInfo {
    static func sample() -> WeatherInfo {
        return .init(latitude: 5.87, longitude: 4.56, timezone: "Europe/Stockholm", currently: .init(time: 1.23, temperature: 4.56, apparentTemperature: 5.67, dewPoint: 2.34, humidity: 2.34, pressure: 4.34, windSpeed: 2.34, windGust: 4.56, cloudCover: 4.56, ozone: 2.34, visibility: 10))
    }
}
