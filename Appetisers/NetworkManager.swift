//
//  NetworkManager.swift
//  Appetisers
//
//  Created by Shomil Singh on 12/02/24.
//

import Foundation

final class NetworkManager{
    static let shared = NetworkManager()
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizserURL = baseURL + "appetizers"
    
    private init() {}
    
    func getAppetizers(completed : @escaping (Result<[Appetiser] , ApError>) -> Void){
//        check url
        guard let url = URL(string: appetizserURL) else
        {
            completed(.failure(.invalidURL))
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let session = URLSession.shared
        
        let datatask = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error{
                completed(.failure(.somethingwentwrong))
                return
            }
            
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else
            {
                completed(.failure(.Response))
                return
            }
            
            guard let data = data else{
                completed(.failure(.InvalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetiserResponse.self, from: data)
                completed(.success(decodedResponse.request))
            }catch{
                completed(.failure(.InvalidData))
                return
            }
        }
        datatask.resume()
        
    }
}
