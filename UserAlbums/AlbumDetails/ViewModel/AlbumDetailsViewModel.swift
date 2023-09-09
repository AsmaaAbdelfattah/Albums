//
//  AlbumDetailsViewModel.swift
//  UserAlbums
//
//  Created by Asmaa_Abdelfattah on 18/06/1402 AP.
//

import Foundation
import Combine
class AlbumDetailsViewModel: ObservableObject{
  
    @Published var photos = [Photo]()
    let networkService: AlbumsListNetworkServices = AlbumsListNetworkServices()
    func fetchPhotos(id: Int) -> AnyPublisher<[Photo],Error> {
        networkService.get(url: "https://jsonplaceholder.typicode.com/albums/\(id)/photos")
    }
}
