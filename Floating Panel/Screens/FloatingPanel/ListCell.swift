//
//  SwiftUIView.swift
//  Floating Panel
//
//  Created by Mohamed Mostafa on 11/09/2024.
//

import SwiftUI

struct ListCell: View {
    @State var name: String
    var body: some View {
        Text(name)
            .padding()
            .frame(maxWidth: .infinity)
            .cornerRadius(10)
            .overlay(content: {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            })
    }
}


#Preview {
    ListCell(name: "Apple Frameworks")
}
