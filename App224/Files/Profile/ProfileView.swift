//
//  ProfileView.swift
//  App224
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI
import StoreKit

struct ProfileView: View {
    
    @AppStorage("money") var money: Int = 10000
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.black)
                    .font(.system(size: 17, weight: .medium))
                    .padding()
                
                VStack {
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://docs.google.com/document/d/1fkzq6X7ezAJcbBiDcOvsd7EUEdVBkA4ZTnFoS4d7RNQ/edit?usp=sharing") else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        HStack {
                            
                            Text("Usage Policy")
                                .foregroundColor(.black)
                                .font(.system(size: 15 ,weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        .padding(.horizontal)
                    })
                    
                    HStack {
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            HStack {
                                
                                Text("Rate Us")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15 ,weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "star")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        })
                        
                        Button(action: {
                            
                            money += 10000
                            
                        }, label: {
                            
                            HStack {
                                
                                Text("Add money")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15 ,weight: .regular))
                                
                                Spacer()
                                
                                Image(systemName: "dollarsign")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        })
                    }
                    .padding(.horizontal)
                }
                .frame(maxHeight: .infinity, alignment: .center)
            }
        }
    }
}

#Preview {
    ProfileView()
}
