import Combine
import CoreLocation

class ForecastViewModel: ObservableObject {
    @Published var forecast: [DailyForecast] = []
    @Published var cityName = ""
    
    private let forecastService = ForecastService()
    private var cancellables = Set<AnyCancellable>()
    
    func fetchWeather(for city: String) {
        forecastService.fetchForecast(city: city)
            .sink { [weak self] completion in
                print(completion)
            } receiveValue: { [weak self] response in
                self?.cityName = response.cityName
                self?.forecast = response.data
            }
            .store(in: &cancellables)
    }
    
    func fetchCityName(from location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
            if let city = placemarks?.first?.locality {
                DispatchQueue.main.async {
                    self?.fetchWeather(for: city)
                }
            }
        }
    }
    var todayForecast: DailyForecast? {
        forecast.first(where: { $0.date == getTodayDateString() })
    }
    
    func getTodayDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: Date())
    }
}
