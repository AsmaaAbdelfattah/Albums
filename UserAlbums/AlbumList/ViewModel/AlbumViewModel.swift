//
//  AlbumViewModel.swift
//  UserAlbums
//
//  Created by Asmaa_Abdelfattah on 16/06/1402 AP.
//

import Foundation
import Combine
import Moya
class AlbumViewModel : ObservableObject{
    @Published var user: User = User(id: 0, address: Address(street: "", suite: "", city: "", zipcode: ""))
    @Published var albums = [Album]()
    let networkService: AlbumsListNetworkServices = AlbumsListNetworkServices()
    func fetchUsers() -> AnyPublisher<[User],Error> {
        self.networkService.get(url: "https://jsonplaceholder.typicode.com/users")
    }
    func fetchAlbums(users: [User]) -> AnyPublisher<[Album],Error>{
        self.user = users.randomElement()!
        print("llfll")
        print(user)
      return networkService.getAlbums(url: "https://jsonplaceholder.typicode.com/users/\(user.id)/albums")
        
    }
 
    func chainApiCall() -> AnyPublisher<[Album], Error> {
        fetchUsers().flatMap(fetchAlbums).eraseToAnyPublisher()
        }
    func loadUsers() -> AnyPublisher<Response,MoyaError>{
        networkService.loadData(url: .users)
    }
    }
                                                

