import SwiftUI

struct DailyForecastView: View {
    @StateObject private var viewModel = ForecastViewModel()
    
    let forecast: DailyForecast
    
    var body: some View {
        VStack {
            HStack {
                if let iconURL = URL(string: "\(Constants.forecastURLIcon)\(forecast.weather.icon).png") {
                    AsyncImage(url: iconURL) { image in
                        image.resizable()
                            .frame(width: 50, height: 50)
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                Text("\(Int(forecast.temp ?? 0))°C")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                
                Text(viewModel.cityName)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
            }
            
            Text(forecast.weather.description.capitalized)
                .foregroundColor(.white.opacity(0.9))
            
            HStack(spacing: 50) {
                VStack {
                    Text(Constants.ForecastDetail.wind)
                        .font(.headline)
                        .foregroundColor(.white)
                    Image(systemName: Constants.Images.wind)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.red)
                    Text("\(forecast.windSpeed, specifier: "%.1f") m/s")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                
                VStack {
                    Text(Constants.ForecastDetail.humidity)
                        .font(.headline)
                        .foregroundColor(.white)
                    Image(systemName: Constants.Images.humadity)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                    Text("\(forecast.rh)%")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                
                VStack {
                    Text("\(Constants.ForecastDetail.rain)%")
                        .font(.headline)
                        .foregroundColor(.white)
                    Image(systemName: Constants.Images.rain)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.orange)
                    Text("\(Int(forecast.pop))%")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
            .padding(20)
        }
    }
}
