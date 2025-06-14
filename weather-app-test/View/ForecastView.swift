import SwiftUI

struct ForecastView: View {
    @StateObject private var viewModel = ForecastViewModel()
    @StateObject private var locationManager = LocationManager()
    
    @State private var city = ""
    @State private var hasFetchedLocation = false
    
    var body: some View {
        VStack {
            TextField("Select your city", text: $city)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Get forecast") {
                viewModel.fetchWeather(for: city)
            }
            .padding()
            
            ScrollView {
                ForEach(viewModel.forecast) { forecast in
                    ForecastRow(forecast: forecast)
                }
                
                Spacer()
            }
        }
        .onReceive(locationManager.$lastLocation) { location in
            guard let location, !hasFetchedLocation else { return }
            hasFetchedLocation = true
            viewModel.fetchCityName(from: location)
        }
        .padding()
    }
}

struct ForecastRow: View {
    let forecast: DailyForecast
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(forecast.date)
                    .font(.headline)
                Text(forecast.weather.description)
                    .font(.subheadline)
            }
            
            Spacer()
            
            HStack {
                Text("max: \(Int(forecast.highTemp))")
                Text("low: \(Int(forecast.lowTemp))")
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 2)
        .padding(.horizontal)
    }
}

#Preview {
    ForecastView()
}
