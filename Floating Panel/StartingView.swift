//
//  ContentView.swift
//  Floating Panel
//
//  Created by Mohamed Mostafa on 10/09/2024.
//

import SwiftUI

struct StartingView: View {
    @State var isShowingFloatingPanel = false
    var body: some View {
        VStack {
            Button {
                isShowingFloatingPanel = true
            } label: {
                Text("Show Floating Panel")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(width: 280, height: 50)
                    .background(.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

        }
        .padding()
    }
}

#Preview {
    StartingView()
}
