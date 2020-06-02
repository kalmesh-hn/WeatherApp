// MARK: - Mocks generated from file: WeatherApp/location-module/LocationManager.swift at 2020-05-31 09:59:14 +0000

//
//  LocationManager.swift
//  WeatherApp
//

//  Copyright © 2020 Kalmesh. All rights reserved.
//

import Cuckoo
@testable import WeatherApp

import CoreLocation
import Foundation


 class MockLocationManagerProtocol: LocationManagerProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = LocationManagerProtocol
    
     typealias Stubbing = __StubbingProxy_LocationManagerProtocol
     typealias Verification = __VerificationProxy_LocationManagerProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: LocationManagerProtocol?

     func enableDefaultImplementation(_ stub: LocationManagerProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var locationDelegate: LocationProtocol? {
        get {
            return cuckoo_manager.getter("locationDelegate",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.locationDelegate)
        }
        
        set {
            cuckoo_manager.setter("locationDelegate",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.locationDelegate = newValue)
        }
        
    }
    

    

    
    
    
     func requestLocalAuthorization()  {
        
    return cuckoo_manager.call("requestLocalAuthorization()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.requestLocalAuthorization())
        
    }
    

	 struct __StubbingProxy_LocationManagerProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var locationDelegate: Cuckoo.ProtocolToBeStubbedOptionalProperty<MockLocationManagerProtocol, LocationProtocol> {
	        return .init(manager: cuckoo_manager, name: "locationDelegate")
	    }
	    
	    
	    func requestLocalAuthorization() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockLocationManagerProtocol.self, method: "requestLocalAuthorization()", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_LocationManagerProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var locationDelegate: Cuckoo.VerifyOptionalProperty<LocationProtocol> {
	        return .init(manager: cuckoo_manager, name: "locationDelegate", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func requestLocalAuthorization() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("requestLocalAuthorization()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class LocationManagerProtocolStub: LocationManagerProtocol {
    
    
     var locationDelegate: LocationProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (LocationProtocol?).self)
        }
        
        set { }
        
    }
    

    

    
     func requestLocalAuthorization()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}



 class MockLocationProtocol: LocationProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = LocationProtocol
    
     typealias Stubbing = __StubbingProxy_LocationProtocol
     typealias Verification = __VerificationProxy_LocationProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: LocationProtocol?

     func enableDefaultImplementation(_ stub: LocationProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func didDetectLocation(location: CLLocation?, error: Error?)  {
        
    return cuckoo_manager.call("didDetectLocation(location: CLLocation?, error: Error?)",
            parameters: (location, error),
            escapingParameters: (location, error),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.didDetectLocation(location: location, error: error))
        
    }
    
    
    
     func showLocationDisabledPopup()  {
        
    return cuckoo_manager.call("showLocationDisabledPopup()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.showLocationDisabledPopup())
        
    }
    

	 struct __StubbingProxy_LocationProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func didDetectLocation<M1: Cuckoo.OptionalMatchable, M2: Cuckoo.OptionalMatchable>(location: M1, error: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(CLLocation?, Error?)> where M1.OptionalMatchedType == CLLocation, M2.OptionalMatchedType == Error {
	        let matchers: [Cuckoo.ParameterMatcher<(CLLocation?, Error?)>] = [wrap(matchable: location) { $0.0 }, wrap(matchable: error) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockLocationProtocol.self, method: "didDetectLocation(location: CLLocation?, error: Error?)", parameterMatchers: matchers))
	    }
	    
	    func showLocationDisabledPopup() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockLocationProtocol.self, method: "showLocationDisabledPopup()", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_LocationProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func didDetectLocation<M1: Cuckoo.OptionalMatchable, M2: Cuckoo.OptionalMatchable>(location: M1, error: M2) -> Cuckoo.__DoNotUse<(CLLocation?, Error?), Void> where M1.OptionalMatchedType == CLLocation, M2.OptionalMatchedType == Error {
	        let matchers: [Cuckoo.ParameterMatcher<(CLLocation?, Error?)>] = [wrap(matchable: location) { $0.0 }, wrap(matchable: error) { $0.1 }]
	        return cuckoo_manager.verify("didDetectLocation(location: CLLocation?, error: Error?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func showLocationDisabledPopup() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("showLocationDisabledPopup()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class LocationProtocolStub: LocationProtocol {
    

    

    
     func didDetectLocation(location: CLLocation?, error: Error?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func showLocationDisabledPopup()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: WeatherApp/network-module/NetworkClient.swift at 2020-05-31 09:59:14 +0000

//
//  NetworkClient.swift
//  WeatherApp
//
//  Copyright © 2020 Kalmesh. All rights reserved.
//

import Cuckoo
@testable import WeatherApp

import Foundation


 class MockNetworkClientProtocol: NetworkClientProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = NetworkClientProtocol
    
     typealias Stubbing = __StubbingProxy_NetworkClientProtocol
     typealias Verification = __VerificationProxy_NetworkClientProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: NetworkClientProtocol?

     func enableDefaultImplementation(_ stub: NetworkClientProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func getWeatherDetails(latitude: Double, longitude: Double, completion: @escaping (WeatherResult) -> Void)  {
        
    return cuckoo_manager.call("getWeatherDetails(latitude: Double, longitude: Double, completion: @escaping (WeatherResult) -> Void)",
            parameters: (latitude, longitude, completion),
            escapingParameters: (latitude, longitude, completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getWeatherDetails(latitude: latitude, longitude: longitude, completion: completion))
        
    }
    

	 struct __StubbingProxy_NetworkClientProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getWeatherDetails<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(latitude: M1, longitude: M2, completion: M3) -> Cuckoo.ProtocolStubNoReturnFunction<(Double, Double, (WeatherResult) -> Void)> where M1.MatchedType == Double, M2.MatchedType == Double, M3.MatchedType == (WeatherResult) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(Double, Double, (WeatherResult) -> Void)>] = [wrap(matchable: latitude) { $0.0 }, wrap(matchable: longitude) { $0.1 }, wrap(matchable: completion) { $0.2 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNetworkClientProtocol.self, method: "getWeatherDetails(latitude: Double, longitude: Double, completion: @escaping (WeatherResult) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_NetworkClientProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getWeatherDetails<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(latitude: M1, longitude: M2, completion: M3) -> Cuckoo.__DoNotUse<(Double, Double, (WeatherResult) -> Void), Void> where M1.MatchedType == Double, M2.MatchedType == Double, M3.MatchedType == (WeatherResult) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(Double, Double, (WeatherResult) -> Void)>] = [wrap(matchable: latitude) { $0.0 }, wrap(matchable: longitude) { $0.1 }, wrap(matchable: completion) { $0.2 }]
	        return cuckoo_manager.verify("getWeatherDetails(latitude: Double, longitude: Double, completion: @escaping (WeatherResult) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class NetworkClientProtocolStub: NetworkClientProtocol {
    

    

    
     func getWeatherDetails(latitude: Double, longitude: Double, completion: @escaping (WeatherResult) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}



 class MockNetworkClient: NetworkClient, Cuckoo.ClassMock {
    
     typealias MocksType = NetworkClient
    
     typealias Stubbing = __StubbingProxy_NetworkClient
     typealias Verification = __VerificationProxy_NetworkClient

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: NetworkClient?

     func enableDefaultImplementation(_ stub: NetworkClient) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func getWeatherDetails(latitude: Double, longitude: Double, completion: @escaping (WeatherResult) -> Void)  {
        
    return cuckoo_manager.call("getWeatherDetails(latitude: Double, longitude: Double, completion: @escaping (WeatherResult) -> Void)",
            parameters: (latitude, longitude, completion),
            escapingParameters: (latitude, longitude, completion),
            superclassCall:
                
                super.getWeatherDetails(latitude: latitude, longitude: longitude, completion: completion)
                ,
            defaultCall: __defaultImplStub!.getWeatherDetails(latitude: latitude, longitude: longitude, completion: completion))
        
    }
    

	 struct __StubbingProxy_NetworkClient: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getWeatherDetails<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(latitude: M1, longitude: M2, completion: M3) -> Cuckoo.ClassStubNoReturnFunction<(Double, Double, (WeatherResult) -> Void)> where M1.MatchedType == Double, M2.MatchedType == Double, M3.MatchedType == (WeatherResult) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(Double, Double, (WeatherResult) -> Void)>] = [wrap(matchable: latitude) { $0.0 }, wrap(matchable: longitude) { $0.1 }, wrap(matchable: completion) { $0.2 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNetworkClient.self, method: "getWeatherDetails(latitude: Double, longitude: Double, completion: @escaping (WeatherResult) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_NetworkClient: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getWeatherDetails<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.Matchable>(latitude: M1, longitude: M2, completion: M3) -> Cuckoo.__DoNotUse<(Double, Double, (WeatherResult) -> Void), Void> where M1.MatchedType == Double, M2.MatchedType == Double, M3.MatchedType == (WeatherResult) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(Double, Double, (WeatherResult) -> Void)>] = [wrap(matchable: latitude) { $0.0 }, wrap(matchable: longitude) { $0.1 }, wrap(matchable: completion) { $0.2 }]
	        return cuckoo_manager.verify("getWeatherDetails(latitude: Double, longitude: Double, completion: @escaping (WeatherResult) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class NetworkClientStub: NetworkClient {
    

    

    
     override func getWeatherDetails(latitude: Double, longitude: Double, completion: @escaping (WeatherResult) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: WeatherApp/view-model/WeatherViewModel.swift at 2020-05-31 09:59:14 +0000

//
//  WeatherViewModel.swift
//  WeatherApp
//

//  Copyright © 2020 Kalmesh. All rights reserved.
//

import Cuckoo
@testable import WeatherApp

import Bond
import CoreLocation
import Foundation


 class MockWeatherViewModelProtocol: WeatherViewModelProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = WeatherViewModelProtocol
    
     typealias Stubbing = __StubbingProxy_WeatherViewModelProtocol
     typealias Verification = __VerificationProxy_WeatherViewModelProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: WeatherViewModelProtocol?

     func enableDefaultImplementation(_ stub: WeatherViewModelProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var weatherDetails: Observable<[WeatherCellDetail]?> {
        get {
            return cuckoo_manager.getter("weatherDetails",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.weatherDetails)
        }
        
    }
    
    
    
     var showLoader: Observable<Bool> {
        get {
            return cuckoo_manager.getter("showLoader",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.showLoader)
        }
        
    }
    
    
    
     var showAlert: Observable<UIAlertController?> {
        get {
            return cuckoo_manager.getter("showAlert",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.showAlert)
        }
        
    }
    

    

    
    
    
     func viewLoaded()  {
        
    return cuckoo_manager.call("viewLoaded()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.viewLoaded())
        
    }
    

	 struct __StubbingProxy_WeatherViewModelProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var weatherDetails: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockWeatherViewModelProtocol, Observable<[WeatherCellDetail]?>> {
	        return .init(manager: cuckoo_manager, name: "weatherDetails")
	    }
	    
	    
	    var showLoader: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockWeatherViewModelProtocol, Observable<Bool>> {
	        return .init(manager: cuckoo_manager, name: "showLoader")
	    }
	    
	    
	    var showAlert: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockWeatherViewModelProtocol, Observable<UIAlertController?>> {
	        return .init(manager: cuckoo_manager, name: "showAlert")
	    }
	    
	    
	    func viewLoaded() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherViewModelProtocol.self, method: "viewLoaded()", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_WeatherViewModelProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var weatherDetails: Cuckoo.VerifyReadOnlyProperty<Observable<[WeatherCellDetail]?>> {
	        return .init(manager: cuckoo_manager, name: "weatherDetails", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var showLoader: Cuckoo.VerifyReadOnlyProperty<Observable<Bool>> {
	        return .init(manager: cuckoo_manager, name: "showLoader", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var showAlert: Cuckoo.VerifyReadOnlyProperty<Observable<UIAlertController?>> {
	        return .init(manager: cuckoo_manager, name: "showAlert", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func viewLoaded() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("viewLoaded()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class WeatherViewModelProtocolStub: WeatherViewModelProtocol {
    
    
     var weatherDetails: Observable<[WeatherCellDetail]?> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Observable<[WeatherCellDetail]?>).self)
        }
        
    }
    
    
     var showLoader: Observable<Bool> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Observable<Bool>).self)
        }
        
    }
    
    
     var showAlert: Observable<UIAlertController?> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Observable<UIAlertController?>).self)
        }
        
    }
    

    

    
     func viewLoaded()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}



 class MockWeatherViewModel: WeatherViewModel, Cuckoo.ClassMock {
    
     typealias MocksType = WeatherViewModel
    
     typealias Stubbing = __StubbingProxy_WeatherViewModel
     typealias Verification = __VerificationProxy_WeatherViewModel

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: WeatherViewModel?

     func enableDefaultImplementation(_ stub: WeatherViewModel) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var weatherDetails: Observable<[WeatherCellDetail]?> {
        get {
            return cuckoo_manager.getter("weatherDetails",
                superclassCall:
                    
                    super.weatherDetails
                    ,
                defaultCall: __defaultImplStub!.weatherDetails)
        }
        
        set {
            cuckoo_manager.setter("weatherDetails",
                value: newValue,
                superclassCall:
                    
                    super.weatherDetails = newValue
                    ,
                defaultCall: __defaultImplStub!.weatherDetails = newValue)
        }
        
    }
    
    
    
     override var showLoader: Observable<Bool> {
        get {
            return cuckoo_manager.getter("showLoader",
                superclassCall:
                    
                    super.showLoader
                    ,
                defaultCall: __defaultImplStub!.showLoader)
        }
        
        set {
            cuckoo_manager.setter("showLoader",
                value: newValue,
                superclassCall:
                    
                    super.showLoader = newValue
                    ,
                defaultCall: __defaultImplStub!.showLoader = newValue)
        }
        
    }
    
    
    
     override var showAlert: Observable<UIAlertController?> {
        get {
            return cuckoo_manager.getter("showAlert",
                superclassCall:
                    
                    super.showAlert
                    ,
                defaultCall: __defaultImplStub!.showAlert)
        }
        
        set {
            cuckoo_manager.setter("showAlert",
                value: newValue,
                superclassCall:
                    
                    super.showAlert = newValue
                    ,
                defaultCall: __defaultImplStub!.showAlert = newValue)
        }
        
    }
    

    

    
    
    
     override func viewLoaded()  {
        
    return cuckoo_manager.call("viewLoaded()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.viewLoaded()
                ,
            defaultCall: __defaultImplStub!.viewLoaded())
        
    }
    

	 struct __StubbingProxy_WeatherViewModel: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var weatherDetails: Cuckoo.ClassToBeStubbedProperty<MockWeatherViewModel, Observable<[WeatherCellDetail]?>> {
	        return .init(manager: cuckoo_manager, name: "weatherDetails")
	    }
	    
	    
	    var showLoader: Cuckoo.ClassToBeStubbedProperty<MockWeatherViewModel, Observable<Bool>> {
	        return .init(manager: cuckoo_manager, name: "showLoader")
	    }
	    
	    
	    var showAlert: Cuckoo.ClassToBeStubbedProperty<MockWeatherViewModel, Observable<UIAlertController?>> {
	        return .init(manager: cuckoo_manager, name: "showAlert")
	    }
	    
	    
	    func viewLoaded() -> Cuckoo.ClassStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockWeatherViewModel.self, method: "viewLoaded()", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_WeatherViewModel: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var weatherDetails: Cuckoo.VerifyProperty<Observable<[WeatherCellDetail]?>> {
	        return .init(manager: cuckoo_manager, name: "weatherDetails", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var showLoader: Cuckoo.VerifyProperty<Observable<Bool>> {
	        return .init(manager: cuckoo_manager, name: "showLoader", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var showAlert: Cuckoo.VerifyProperty<Observable<UIAlertController?>> {
	        return .init(manager: cuckoo_manager, name: "showAlert", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func viewLoaded() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("viewLoaded()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class WeatherViewModelStub: WeatherViewModel {
    
    
     override var weatherDetails: Observable<[WeatherCellDetail]?> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Observable<[WeatherCellDetail]?>).self)
        }
        
        set { }
        
    }
    
    
     override var showLoader: Observable<Bool> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Observable<Bool>).self)
        }
        
        set { }
        
    }
    
    
     override var showAlert: Observable<UIAlertController?> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Observable<UIAlertController?>).self)
        }
        
        set { }
        
    }
    

    

    
     override func viewLoaded()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

