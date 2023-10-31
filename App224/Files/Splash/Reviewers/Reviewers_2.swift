//
//  Reviewers_2.swift
//  App224
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI

struct Reviewers_2: View {
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("reviewers_2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .center, spacing: 5, content: {
                    
                    Text("Investment signals")
                        .foregroundColor(.black)
                        .font(.system(size: 25, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("Real-time analytics")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding()
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Reviewers_3()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
            }
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

#Preview {
    Reviewers_2()
}
