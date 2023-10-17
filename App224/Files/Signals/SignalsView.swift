//
//  SignalsView.swift
//  App224
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI

struct SignalsView: View {
    
    @StateObject var viewModel = SignalsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                
                Text("Growing signals")
                    .foregroundColor(.black)
                    .font(.system(size: 16 ,weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if viewModel.isLoading {
                    
                    ProgressView()
                        .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    if viewModel.signals.isEmpty {
                        
                        VStack(spacing: 7, content: {
                            
                            Image("empty")
                            
                            Text("Empty Signals")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .semibold))
                                .multilineTextAlignment(.center)
                            
                            Text("No any signals right now")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .regular))
                                .multilineTextAlignment(.center)
                        })
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.signals.prefix(11), id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedSignal = index
                                        viewModel.isDetail = true
                                        
                                    }, label: {
                                        
                                        VStack {
                                            
                                            HStack {
                                                
                                                VStack(alignment: .leading, spacing: 8, content: {
                                                    
                                                    Text(index.resultInstrument)
                                                        .foregroundColor(.black)
                                                        .font(.system(size: 15, weight: .medium))
                                                    
                                                    HStack {
                                                        
                                                        HStack(spacing: 6, content: {
                                                            
                                                            Text("S/I")
                                                                .foregroundColor(.black)
                                                                .font(.system(size: 14, weight: .medium))
                                                            
                                                            Text("\(index.resultSl)")
                                                                .foregroundColor(.red)
                                                                .font(.system(size: 14, weight: .medium))
                                                        })
                                                        
                                                        HStack(spacing: 6, content: {
                                                            
                                                            Text("T/P")
                                                                .foregroundColor(.black)
                                                                .font(.system(size: 14, weight: .medium))
                                                            
                                                            Text("\(index.resultTp)")
                                                                .foregroundColor(.green)
                                                                .font(.system(size: 14, weight: .medium))
                                                        })
                                                    }
                                                    
                                                    Text(index.resultDate)
                                                        .foregroundColor(.gray)
                                                        .font(.system(size: 13, weight: .regular))
                                                })
                                                
                                                Spacer()
                                                
                                                VStack(alignment: .trailing, spacing: 8, content: {
                                                    
                                                    Text("$\(String(format: "%.2f", index.resultP))")
                                                        .foregroundColor(.black)
                                                        .font(.system(size: 17, weight: .medium))
                                                    
                                                    Text("Down")
                                                        .foregroundColor(.red)
                                                        .font(.system(size: 13, weight: .regular))
                                                })
                                            }
                                            .padding()
                                            
                                            Rectangle()
                                                .fill(.gray.opacity(0.1))
                                                .frame(height: 2)
                                        }
                                    })
                                }
                            }
                        }
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
            .padding([.horizontal, .top])
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .onAppear {
            
            viewModel.getPodcasts()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            SignalsDetail(index: viewModel.selectedSignal)
        })
    }
}

#Preview {
    SignalsView()
}
