//
//  WeatherViewModel.swift
//  WeatherApp
//

//  Copyright © 2020 Kalmesh. All rights reserved.
//

import Foundation
import Bond
import CoreLocation

struct WeatherCellDetail {
    let detailKey: String
    let detailValue: String
    
    init(_ key: String, _ value: String) {
        detailKey = key
        detailValue = value
    }
}

protocol WeatherViewModelProtocol {
    var weatherDetails: Observable<[WeatherCellDetail]?> { get }
    var showLoader: Observable<Bool> { get }
    var showAlert: Observable<UIAlertController?> { get }
    
    func viewLoaded()
}

class WeatherViewModel: WeatherViewModelProtocol {
    var weatherDetails = Observable<[WeatherCellDetail]?>(nil)
    private let networkClient: NetworkClientProtocol
    var showLoader = Observable<Bool>(false)
    var showAlert = Observable<UIAlertController?>(nil)
    private let dateFormatter = DateFormatter()

    // Used to start getting the users location
    private var locationManager: LocationManagerProtocol
    
    
    init(
        networkClient: NetworkClientProtocol = NetworkClient(),
        locationManager: LocationManagerProtocol = LocationManager(locationDelegate: nil)
    ) {
        self.networkClient = networkClient
        self.locationManager = locationManager
        self.locationManager.locationDelegate = self
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.timeZone = .current
    }
    
    func viewLoaded() {
        // ask location manager to get the current location
        locationManager.requestLocalAuthorization()
    }
    
    private func buildViewModel(from weatherDetails: WeatherInfo)-> [WeatherCellDetail] {
        print(weatherDetails)
        let date = Date(timeIntervalSince1970: TimeInterval(weatherDetails.currently.time))
        return [
            .init("Time Zone", String(weatherDetails.timezone)),
            .init("Current Time", dateFormatter.string(from: date)),
            .init("Temperature", String(weatherDetails.currently.temperature)),
            .init("Feels like", String(weatherDetails.currently.apparentTemperature)),
            .init("Wind Speed", String(weatherDetails.currently.windSpeed)),
            .init("Humidity", String(weatherDetails.currently.humidity)),
            .init("Visibility", String(weatherDetails.currently.visibility))
        ]
    }
    
    private func failureAlert(message: String) -> UIAlertController {
        let alert = UIAlertController(
            title: "Failure",
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }
}

extension WeatherViewModel: LocationProtocol {
    func didDetectLocation(location: CLLocation?, error: Error?) {
        guard let location = location else {
            self.showAlert.value = self.failureAlert(message: error?.localizedDescription ?? "")
            return
        }
        
        self.showLoader.value = true
        
        // make network call to get the weather info
        networkClient.getWeatherDetails(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude) {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let weatherInfo):
                DispatchQueue.main.async {
                    self.showLoader.value = false
                    self.weatherDetails.value = self.buildViewModel(from: weatherInfo)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showLoader.value = false
                    self.showAlert.value = self.failureAlert(message: error.localizedDescription)
                }
            }
        }
    }
    
    func showLocationDisabledPopup() {
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        
        let alert = UIAlertController(
            title: "Background Location Access Disabled",
            message: "In order to show nearest tube stations, we need your location",
            preferredStyle: .alert
        )
        alert.addAction(cancelAction)
        alert.addAction(openAction)
        self.showAlert.value = alert
    }
}
