import Combine

class ForecastViewModel: ObservableObject {
    @Published var forecast: [DailyForecast] = []
    @Published var cityName = ""
    
    private let forecastService = ForecastService()
    private var cancellables = Set<AnyCancellable>()
    
    func fetchWeather(for city: String) {
        forecastService.fetchForecast(city: city)
            .sink { [weak self] completion in
            } receiveValue: { [weak self] response in
                self?.cityName = response.cityName
                self?.forecast = response.data
            }
            .store(in: &cancellables)
    }
}
