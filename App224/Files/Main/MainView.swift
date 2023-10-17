//
//  MainView.swift
//  App224
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI

struct MainView: View {

    @AppStorage("money") var money: Int = 10000
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack(alignment: .bottom) {
                    
                    VStack(alignment: .leading, spacing: 7, content: {
                        
                        Text("Total balance")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                        Text("$\(money)")
                            .foregroundColor(.black)
                            .font(.system(size: 25, weight: .semibold))
                    })
                    
                    Spacer()
                    
                    Text("USD")
                        .foregroundColor(.gray)
                        .font(.system(size: 11, weight: .regular))
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                .padding([.horizontal, .top])
                
                HStack {
                    
                    NavigationLink(destination: {
                        
                        MainChart()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                
                                Text("All Income")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Text("$\(0)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .semibold))
                            })
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    })
                    
                    VStack(alignment: .leading, spacing: 5, content: {
                        
                        Text("Used Signals")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                        Text("\(0)")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                    })
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, content: {
                    
                    VStack(alignment: .leading, spacing: 6, content: {
                        
                        Text("Level Start")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                        
                        Text("Every profitable signal increases your level")
                            .foregroundColor(.black)
                            .font(.system(size: 13, weight: .regular))
                    })
                    
                    Image("chart_2")
                        .resizable()
                        .frame(width: 250, height: 240)
                        .frame(maxWidth: .infinity, alignment: .center)
                })
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    MainView()
}
