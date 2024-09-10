//
//  ContentView.swift
//  Floating Panel
//
//  Created by Mohamed Mostafa on 10/09/2024.
//

import SwiftUI

struct StartingView: View {
    @State var isShowingFloatingPanel = false
    @State private var offset: CGFloat = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
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
            
            if isShowingFloatingPanel {
                Color(.label).opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                
                    Spacer()
                    
                    FloatingListpanel(isShowingFloatingPanel: $isShowingFloatingPanel)
                        .frame(height: UIScreen.main.bounds.height * 0.9)
                        .edgesIgnoringSafeArea(.bottom)
                        .transition(.move(edge: .bottom))
                        .cornerRadius(20)
                        .position(CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2))
                        .animation(.easeInOut)
                
                
                }
        }
    }
}

#Preview {
    StartingView()
}
