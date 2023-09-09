//
//  NetworkService.swift
//  UserAlbums
//
//  Created by Asmaa_Abdelfattah on 16/06/1402 AP.
//

import Foundation
import Combine
import Moya

protocol AlbumsListServices {
    func get<T: Decodable>(url: String?)-> AnyPublisher<T, Error>
}
class AlbumsListNetworkServices : AlbumsListServices{
    var cancellables = Set<AnyCancellable>()
    func get<T: Decodable>(url: String?)-> AnyPublisher<T, Error>{
        
        return   URLSession.shared.dataTaskPublisher(for: URL(string: url ?? "")!)
            .tryMap { result in
                guard let response =  result.response as? HTTPURLResponse, response.statusCode == 200 else{
                    throw URLError(.badServerResponse)
                }
                return result.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    func getAlbums(url: String?)-> AnyPublisher<[Album], Error>{
        
        return   URLSession.shared.dataTaskPublisher(for: URL(string: url ?? "")!)
            .tryMap { result in
                guard let response =  result.response as? HTTPURLResponse, response.statusCode == 200 else{
                    throw URLError(.badServerResponse)
                }
                return result.data
            }
            .decode(type: [Album].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    func loadData(url: services)-> AnyPublisher<Response, MoyaError>{
        
        return MoyaProvider<services>().requestPublisher(url).filterSuccessfulStatusCodes().eraseToAnyPublisher()
        
    }
}


