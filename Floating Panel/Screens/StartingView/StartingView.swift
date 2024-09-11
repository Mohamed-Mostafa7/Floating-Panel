//
//  ContentView.swift
//  Floating Panel
//
//  Created by Mohamed Mostafa on 10/09/2024.
//

import SwiftUI

struct StartingView: View {
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                Button {
                    viewModel.isShowingFloatingPanel = true
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
            
            if viewModel.isShowingFloatingPanel {
                Color(.label).opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                                
                FloatingListpanel(isShowingFloatingPanel: $viewModel.isShowingFloatingPanel, panelPosition: $viewModel.position)
                    .frame(height: UIScreen.main.bounds.height)
                    .transition(.move(edge: .bottom))
                    .cornerRadius(20)
                    .position(viewModel.position)
                    .offset(CGSize(width: 0, height: viewModel.offset))
                    .gesture(DragGesture()
                        .onChanged({ value in
                            guard value.location.y > 0 else {return}
                            viewModel.offset = value.translation.height
                    })
                        .onEnded({ value in
                            withAnimation {
                                viewModel.offset = .zero
                                viewModel.CalculatePosition(currentPanelYPosition: value.location.y)
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
