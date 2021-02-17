//
//  LandmarkRow.swift
//  UpdatedRush
//
//  Created by EgorErmin on 16.02.2021.
//

import SwiftUI

struct RadioRow: View {
    var radio: Radio
    private let numberStar = 5
    
    var body: some View {
        HStack {
            radio.image
                .resizable()
                .frame(width: 80, height: 80)
            
            VStack(alignment: .leading) {
                Text(radio.name)
                    .bold()
                HStack {
                    Image(systemName: "tag.fill")
                        .frame(width: 25)
                    ForEach(radio.tags, id: \.self) {
                        Text("\($0.name)")
                    }
                }
                .foregroundColor(Color.init(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .frame(width: 25)
                    Text(radio.location)
                }
                .foregroundColor(Color.init(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                HStack {
                    ForEach(0..<radio.rating) { _ in
                        Image(systemName: "star.fill")
                    }
                    ForEach(0..<(numberStar - radio.rating)) { _ in
                        Image(systemName: "star")
                    }
                    Image(systemName: "speaker.3.fill")
                        .padding(.leading, 5)
                    Text("\(radio.views)")
                }
            }
            
            Spacer()
        }
    }
}

#if DEBUG
struct RadioRow_Previews: PreviewProvider {
    static var previews: some View {
        RadioRow(radio: radios[0])
            //.previewLayout(.fixed(width: 500, height: 100))
    }
}
#endif
