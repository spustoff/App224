//
//  SignalsDetail.swift
//  App224
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI

struct SignalsDetail: View {
    
    @Environment(\.presentationMode) var router
    
    let index: DiscoveryItem
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(index.resultInstrument)
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
                .padding(.top)
                
                VStack(alignment: .leading, spacing: 30) {
                    
                    HStack {
                        
                        Text("Stop loss")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                        Spacer()
                        
                        Text("\(index.resultSl)")
                            .foregroundColor(.red)
                            .font(.system(size: 14, weight: .regular))
                    }
                    
                    HStack {
                        
                        Text("Take profit")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                        Spacer()
                        
                        Text("\(index.resultTp)")
                            .foregroundColor(.green)
                            .font(.system(size: 14, weight: .regular))
                    }
                    
                    HStack {
                        
                        Text("Timeframe")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                        Spacer()
                        
                        Text(index.resultPeriod)
                            .foregroundColor(.blue)
                            .font(.system(size: 14, weight: .regular))
                    }
                    
                    HStack {
                        
                        Text("Date")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                        Spacer()
                        
                        Text(index.resultDate)
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                .padding()
                
                Spacer()
                
                Button(action: {
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Done")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                        .padding()
                })
            }
        }
    }
}

#Preview {
    SignalsDetail(index: DiscoveryItem(resultHash: "", resultInstrument: "", resultPeriod: "", resultTp: 5, resultSl: 9, resultP: 9, resultSignal: "", resultDate: ""))
}
