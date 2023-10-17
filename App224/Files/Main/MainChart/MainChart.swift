//
//  MainChart.swift
//  App224
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI

struct MainChart: View {
    
    @State var pair: String = "EURUSD"
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Income")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 10, content: {
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text(pair)
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                            
                            Text("Pair")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        })
                    }
                    
                    HStack {
                        
                        Text("$\(Int.random(in: 1...25555))")
                            .foregroundColor(.black)
                            .font(.system(size: 21, weight: .semibold))
                        
                        Text("+\(Int.random(in: 1...25))%")
                            .foregroundColor(.green)
                            .font(.system(size: 13, weight: .regular))
                            .padding(8)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                    }
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.horizontal, .top])
                .padding(.top)
                
                Chart(pair: pair)
                    .disabled(true)
            }
        }
    }
}

#Preview {
    MainChart()
}
