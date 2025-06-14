import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    var onSearch: () -> Void
    
    var body: some View {
        HStack {
            TextField(Constants.Texts.searchCityButtonTitle, text: $text, onCommit: onSearch)
                .padding(.vertical, 6)
                .padding(.horizontal)
                .background(Color.clear)
                .foregroundColor(.primary)
                .font(.body)
            
            Button(action: onSearch) {
                Image(systemName: Constants.Images.glassIcon)
            }
            .padding(.trailing)
        }
        .padding(.vertical)
    }
}
