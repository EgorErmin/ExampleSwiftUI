//
//  SearchView.swift
//  UpdatedRush
//
//  Created by EgorErmin on 17.02.2021.
//

import SwiftUI

struct SearchView: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Spacer(minLength: 16)
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Поиск по названию", text: $text)
                    .foregroundColor(.black)
            }
            .padding(EdgeInsets(top: 12, leading: 8, bottom: 12, trailing: 8))
            .foregroundColor(.secondary)
            .background(Color.init(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
            .cornerRadius(8)
            Spacer(minLength: 16)
        }
    }
}

#if DEBUG
//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        //SearchView(text: )
//    }
//}
#endif
