//
//  TabBar.swift
//  App224
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 7, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("primary") : Color.gray)
                            .frame(height: 22)
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 23)
        .padding(.bottom, 40)
        .background(Color.white)
    }
}

enum Tab: String, CaseIterable {
    
    case Main = "Main"
    
    case Signals = "Signals"
    
    case Lessons = "Lessons"
    
    case Settings = "Settings"
    
}

#Preview {
    ContentView()
}

