//
//  LessonsView.swift
//  App224
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI

struct LessonsView: View {
    
    @StateObject var viewModel = LessonsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .leading) {
                    
                    Text("Video Lessons")
                        .foregroundColor(.black)
                        .font(.system(size: 16 ,weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if viewModel.isLoading {
                        
                        ProgressView()
                            .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        if viewModel.lessons.isEmpty {
                            
                            VStack(alignment: .center, spacing: 7, content: {
                                
                                Image("empty")
                                
                                Text("Empty")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .semibold))
                                    .multilineTextAlignment(.center)
                                
                                Text("You don't have any properties added yet")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .regular))
                                    .multilineTextAlignment(.center)
                            })
                            .frame(maxHeight: .infinity, alignment: .center)
                            
                        } else {
                            
                            ScrollView(.vertical, showsIndicators: false) {
                                
                                LazyVStack(spacing: 15) {
                                    
                                    ForEach(viewModel.lessons, id: \.self) { index in
                                    
                                        Button(action: {
                                            
                                            viewModel.selectedLesson = index
                                            viewModel.isDetail = true
                                            
                                        }, label: {
                                            
                                            VStack(alignment: .leading, spacing: 8, content: {
                                                
                                                WebPic(urlString: index.image ?? "", width: .infinity, height: 200, cornerRadius: 15, isPlaceholder: true)
                                                
                                                Text(index.title ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 14, weight: .medium))
                                                    .multilineTextAlignment(.leading)
                                                    .lineLimit(2)
                                            })
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
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .onAppear {
            
            viewModel.getVideos()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            VideoDetail(index: viewModel.selectedLesson)
        })
    }
}

#Preview {
    LessonsView()
}
