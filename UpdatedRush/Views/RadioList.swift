//
//  LandmarkList.swift
//  UpdatedRush
//
//  Created by EgorErmin on 16.02.2021.
//

import SwiftUI

struct RadioList: View {
    @Environment(\.presentationMode) var presentationMode
    var name: String
    
    init(name: String) {
        self.name = name
        UINavigationBar.appearance().backgroundColor = .white
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "arrow.left")
                        .padding(.leading, 16)
                        .foregroundColor(.black)
                })
                .padding(.bottom, 10)
                Text(name)
                    .padding(.bottom, 10)
                Spacer()
            }
            .background(
                Rectangle().fill(Color.white).shadow(color: Color.init(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.6)), radius: 2, x: 0, y: 10)
            )
            .font(.title2)
            .frame(height: 30)
            .padding(.top, 15)
            List(radios) { radio in
                RadioRow(radio: radio)
            }
            .padding(.top, 10)
        }
    }
}

#if DEBUG
struct RadioList_Previews: PreviewProvider {
    static var previews: some View {
        RadioList(name: "dsvsd")
    }
}
#endif
