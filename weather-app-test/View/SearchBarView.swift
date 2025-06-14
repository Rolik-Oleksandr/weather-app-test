import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    var onSearch: () -> Void
    
    var body: some View {
        HStack {
            TextField("Search for a city", text: $text, onCommit: onSearch)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.leading)
            
            Button(action: onSearch) {
                Image(systemName: Constants.Images.glassIcon)
            }
            .padding(.trailing)
        }
        .padding(.vertical)
    }
}
