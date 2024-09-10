//
//  FloatingListpanel.swift
//  Floating Panel
//
//  Created by Mohamed Mostafa on 10/09/2024.
//

import SwiftUI

struct FloatingListpanel: View {
    @Binding var isShowingFloatingPanel: Bool
    var body: some View {
        ZStack {
            Color(.systemBackground)
            VStack{
                topView(isShowingFloatingPanel: $isShowingFloatingPanel)
                
                Spacer()
                
                List {
                    ForEach(MockData.frameworks) { framework in
                        Text(framework.name)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .cornerRadius(10)
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            })
                            .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
            }
        }
    }
}

#Preview {
    FloatingListpanel(isShowingFloatingPanel: .constant(false))
}

struct topView: View {
    @Binding var isShowingFloatingPanel: Bool
    
    var body: some View {
        HStack{
            
            VStack{
                Image("")
                    .resizable()
                    .background(Color(.lightGray))
                    .frame(width: 50, height: 6)
                    .foregroundColor(.gray)
                    .cornerRadius(3)
                    .padding(.bottom)
                Text("Trace Results")
            }
            .padding(.leading, 45)
            .frame(maxWidth: .infinity)
            
            
            
            Button {
              isShowingFloatingPanel = false
            } label: {
                Image(systemName: "xmark")
            }
            .foregroundColor(Color(.label))
            .buttonStyle(.bordered)
            .clipShape(Circle())
            
        }
        .padding()
    }
}
