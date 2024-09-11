//
//  ContentView.swift
//  Floating Panel
//
//  Created by Mohamed Mostafa on 10/09/2024.
//

import SwiftUI

struct StartingView: View {
    @State var isShowingFloatingPanel = false
    @State private var offset: CGFloat = 0
    
    @State var position = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2)
    private var as90Percent = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2)
    private var as50Percent = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height - UIScreen.main.bounds.height*0.1)
    
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
                                
                FloatingListpanel(isShowingFloatingPanel: $isShowingFloatingPanel, panelPosition: $position)
                    .frame(height: UIScreen.main.bounds.height)
                    .edgesIgnoringSafeArea(.bottom)
                    .transition(.move(edge: .bottom))
                    .cornerRadius(20)
                    .position(position)
                    .offset(CGSize(width: 0, height: offset))
                    .gesture(DragGesture()
                        .onChanged({ value in
                        offset = value.translation.height
                    })
                        .onEnded({ value in
                            withAnimation {
                                offset = .zero
                                if value.location.y < UIScreen.main.bounds.height * 0.25 {
                                    position = as90Percent
                                }else if value.location.y > UIScreen.main.bounds.height * 0.60 {
                                    isShowingFloatingPanel = false
                                    position = as90Percent
                                } else {
                                    position =  as50Percent
                                }
                            }
                        }))
                    .animation(.easeInOut)
            }
        }
    }
}

#Preview {
    StartingView()
}
