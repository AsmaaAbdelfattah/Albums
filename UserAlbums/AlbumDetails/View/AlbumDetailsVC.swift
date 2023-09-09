//
//  AlbumDetailsVC.swift
//  UserAlbums
//
//  Created by Asmaa_Abdelfattah on 17/06/1402 AP.
//

import UIKit
import Combine
import CombineCocoa
class AlbumDetailsVC: UIViewController {
    @IBOutlet weak var photosCV: UICollectionView!{
        didSet{
            photosCV.delegate = self
            photosCV.dataSource = self
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    var albumTitle :String?
    var albumId:Int?
    @Published var viewModel = AlbumDetailsViewModel()
    @Published var photos = [Photo]()
    @Published var backupPhotos = [Photo]()
    @Published var searchText: String = String()
    var cancellables = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = albumTitle ?? ""
        viewModel.fetchPhotos(id: albumId ?? 0)                   .sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                print("Error is \(error.localizedDescription)")
            case .finished:
                print("Finished")
            }
        }, receiveValue: { photos in
            self.photos = photos
            self.backupPhotos = photos
            DispatchQueue.main.async {
                self.photosCV.reloadData()
            }
        }).store(in:  &cancellables)
        
        searchBar.textDidChangePublisher.sink {completion in
            switch completion {
            case .failure(let error):
                print("Error is \(error.localizedDescription)")
            case .finished:
                print("Finished Search")
            }
        } receiveValue: { text in
            if text.isEmpty{
                self.photos = self.backupPhotos
            }
            self.photos = self.photos.filter({ Photos in
                Photos.title.uppercased().hasPrefix(text.uppercased()) ||
                Photos.title.uppercased().contains(text.uppercased())
               
            })
            DispatchQueue.main.async {
                self.photosCV.reloadData()
            }
        }.store(in: &cancellables)

    }
    
}
                                                
