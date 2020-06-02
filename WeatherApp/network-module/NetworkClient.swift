//
//  NetworkClient.swift
//  WeatherApp
//
//  Copyright © 2020 Kalmesh. All rights reserved.
//

import Foundation

enum NetworkClientError: Swift.Error {
    case apiError(String?)
    case invalidRequest
}

typealias WeatherResult = Result<WeatherInfo, NetworkClientError>

protocol NetworkClientProtocol {
    func getWeatherDetails(
        latitude: Double,
        longitude: Double,
        completion: @escaping (WeatherResult) -> Void
    )
}

class NetworkClient: NetworkClientProtocol {
    
    let urlString = "https://api.darksky.net/forecast/2bb07c3bece89caf533ac9a5d23d8417/"

    func getWeatherDetails(
        latitude: Double,
        longitude: Double,
        completion: @escaping (WeatherResult) -> Void
    ) {
        let weatherUrl = urlString + String(latitude) + "," + String(longitude)
        print(weatherUrl)
        guard let url = URL(string: weatherUrl) else {
            completion(.failure(.invalidRequest))
            return
        }

        makeAPIRequest(request: URLRequest(url: url), completion: completion)
    }
    
    private func makeAPIRequest<T: Decodable>(request: URLRequest, completion: @escaping (Result<T, NetworkClientError>) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let jsonData = data else {
                completion(.failure(.apiError(error?.localizedDescription)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let parsedResponse = try decoder.decode(T.self, from: jsonData)
                completion(.success(parsedResponse))
            } catch {
                completion(.failure(.apiError(error.localizedDescription)))
            }
        }

        dataTask.resume()
    }

}
