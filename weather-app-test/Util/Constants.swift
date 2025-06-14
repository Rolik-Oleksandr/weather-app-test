import Foundation

enum Constants {
    static let apiKey: String = "d64df405e88e4481b922883b23a85f1c"
    static let forecastURLIcon: String = "https://www.weatherbit.io/static/img/icons/"
    static let daysForForecast: Int = 16
    
    enum Texts {
        static let searchCityButtonTitle: String = "Search city"
    }
    
    enum Images {
        static let thermometerIcon: String = "thermometer.variable"
        static let glassIcon: String = "magnifyingglass"
        static let geoIcon: String = "location.circle.fill"
        static let humadity: String = "humidity.fill"
        static let rain: String = "umbrella.fill"
        static let wind: String = "wind"
    }
    
    enum ForecastDetail {
        static let wind: String = "Wind"
        static let humidity: String = "Humidity"
        static let rain: String = "Rain"
    }
}
