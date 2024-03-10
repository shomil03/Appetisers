//
//  NetworkManager.swift
//  Appetisers
//
//  Created by Shomil Singh on 12/02/24.
//

import Foundation

final class NetworkManager : ObservableObject{
    static let shared = NetworkManager()
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizserURL = baseURL + "appetizers"
    
    private init() {}
    
//    func getAppetizers(completed : @escaping (Result<[Appetiser] , ApError>) -> Void){
////        check url
//        guard let url = URL(string: appetizserURL) else
//        {
//            completed(.failure(.invalidURL))
//            return
//        }
//        
//        let urlRequest = URLRequest(url: url)
//        
//        let session = URLSession.shared
//        
//        let datatask = session.dataTask(with: urlRequest) { data, response, error in
//            if error != nil{
//                completed(.failure(.somethingwentwrong))
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else
//            {
//                completed(.failure(.Response))
//                return
//            }
//            
//            guard let data = data else{
//                completed(.failure(.InvalidData))
//                return
//            }
//            
//            do{
//                let decoder = JSONDecoder()
//                let decodedResponse = try decoder.decode(AppetiserResponse.self, from: data)
//                completed(.success(decodedResponse.request))
//            }catch{
//                completed(.failure(.InvalidData))
//                return
//            }
//        }
//        datatask.resume()
//        
//    }
    func getAppetizers() async throws -> [Appetiser]{
        //        check url
        guard let url = URL(string: appetizserURL) else
        {
            throw ApError.invalidURL
        }
        let (data , response) = try await URLSession.shared.data(from: url)
        
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else
            {
                throw ApError.Response
            }
            
           
            
            do{
                let decoder = JSONDecoder()
                return try decoder.decode(AppetiserResponse.self, from: data).request
               
            }catch{
                throw ApError.InvalidData
            }
        
        
    }
}
