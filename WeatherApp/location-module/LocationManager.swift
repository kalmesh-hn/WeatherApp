//
//  LocationManager.swift
//  WeatherApp
//
//  Copyright © 2020 Kalmesh. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationManagerProtocol {
    var locationDelegate: LocationProtocol? { get set }
    func requestLocalAuthorization()
}

protocol LocationProtocol: class {
    func didDetectLocation(location: CLLocation?, error: Error?)
    func showLocationDisabledPopup()
}

final class LocationManager: NSObject, CLLocationManagerDelegate, LocationManagerProtocol {
    
    // calls back to presenter after detecting the location
    weak var locationDelegate: LocationProtocol?
    
    private let locationManager: CLLocationManager
    
    // default location
    private let defaultLocation = CLLocation(latitude: 51.513395, longitude: -0.08909)
    
    init(locationDelegate: LocationProtocol?, geoCoder: CLGeocoder = CLGeocoder(), locationManager: CLLocationManager = CLLocationManager()) {
        self.locationDelegate = locationDelegate
        self.locationManager = locationManager
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.distanceFilter = 100.0
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        // need to add a debouncer here to avoid multiple calls
        self.locationDelegate?.didDetectLocation(location: location, error: nil)
    }
    
    // If app has been deined access, give the user the option to change it
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.denied) {
            // fetch the details for a default(central London) location
            self.locationDelegate?.showLocationDisabledPopup()
            self.locationDelegate?.didDetectLocation(location: defaultLocation, error: nil)
        } else {
            manager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.locationDelegate?.didDetectLocation(location: nil, error: error)
    }
    
    func requestLocalAuthorization() {
        let authorizationStatus = CLLocationManager.authorizationStatus()

        if (authorizationStatus == .authorizedWhenInUse) {
            locationManager.startUpdatingLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
}
