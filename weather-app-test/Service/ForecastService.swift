import Foundation
import Combine

class ForecastService: ObservableObject {
    func fetchForecast(city: String) -> AnyPublisher<ForecastResponce, Error> {
        let urlString = "https://api.weatherbit.io/v2.0/forecast/daily?city=\(city)&key=\(Constants.apiKey)&days=\(Constants.daysForForecast)"
        
        guard let url = URL(string: urlString) else {
            print("Something wrong with url query")
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: ForecastResponce.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
