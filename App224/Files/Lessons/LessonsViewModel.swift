//
//  LessonsViewModel.swift
//  App224
//
//  Created by Вячеслав on 10/17/23.
//

import SwiftUI
import Alamofire

final class LessonsViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    
    @AppStorage("viewed_videos") var viewed_videos: Int = 0
    
    @Published var lessons: [VideoItem] = []
    
    @Published var selectedLesson: VideoItem = VideoItem(id: 1, categoryId: 1, title: "", image: "", video: "", duration: 1)
    @Published var isDetail: Bool = false
    
    func getVideos() {
        
        isLoading = true
        
        self.fetchVideos() { result in
            
            switch result {
                
            case .success(let success):
                
                self.lessons = success.rows
                
            case .failure(let failure):
                
                debugPrint("Parse error - \(failure)")
                
                self.isLoading = false
            }
        }
    }
    
    func fetchVideos(completion: @escaping (Result<VideoModel, Error>) -> Void ) {
        
        isLoading = true
        
        let params: Parameters = [
            
            "token": "0843b6e8-ad53-4a0b-abfd-83bcfec4acd4",
        ]
        
        let request = AF.request("https://sacioper.space/api/v2/video", method: .get, parameters: params)
        
        request.responseDecodable(of: VideoModel.self) { response in
            
            guard let value = response.value else {
                
                self.isLoading = false
                return
            }
                           
            switch response.result{
                
            case .success(_):
                
                completion(.success(value))
                self.isLoading = false
                
            case .failure(_):
                
                completion(.failure(response.error.debugDescription as! Error))
                self.isLoading = false
            }
        }
    }
}
