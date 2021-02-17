//
//  MainView.swift
//  UpdatedRush
//
//  Created by EgorErmin on 17.02.2021.
//

import SwiftUI

struct MainView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            SearchView(text: $searchText)
            ScrollView(.vertical) {
                ForEach(sections, id: \.self) { section in
                    if section.name.hasPrefix(searchText) {
                        SectionView(section: section)
                    }
                }
                AdVc()
                    .frame(height: 160)
                    .padding([.horizontal, .bottom], 16)
            }
        }
    }
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
