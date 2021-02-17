//
//  SectionView.swift
//  UpdatedRush
//
//  Created by EgorErmin on 17.02.2021.
//

import SwiftUI

struct SectionView: View {
    @State private var showingDetail = false
    
    let size: CGFloat = 110
    var section: Section
    
    var body: some View {
        VStack {
            HStack {
                Text(section.name)
                    .font(.title2)
                Spacer()
                Button(action: {
                    showingDetail.toggle()
                }, label: {
                    Image(systemName: "arrow.right")
                        .font(.title2)
                        .foregroundColor(.black)
                })
                .fullScreenCover(isPresented: $showingDetail, content: {
                    RadioList(name: section.name)
                })
            }
            HStack {
                Text(section.description)
                    .foregroundColor(.gray)
                    .font(.callout)
                Spacer()
            }
            ScrollView(.horizontal) {
                HStack(alignment: .top) {
                    ForEach(section.radios, id: \.self) { localRadio in
                        VStack {
                            Image(localRadio.imageName)
                                .resizable()
                                .frame(width: size, height: size)

                            Text(localRadio.name)
                                .frame(width: size, alignment: .leading)
                                .font(.caption)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

#if DEBUG
struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(section: sections[0])
    }
}
#endif
