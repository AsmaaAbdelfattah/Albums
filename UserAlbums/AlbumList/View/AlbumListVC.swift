//
//  ViewController.swift
//  UserAlbums
//
//  Created by Asmaa_Abdelfattah on 16/06/1402 AP.
//

import UIKit
import Combine
class AlbumListVC: UIViewController,ObservableObject {
    
    @IBOutlet weak var albumListTB: UITableView!{
        didSet{
            albumListTB.delegate = self
            albumListTB.dataSource = self
            albumListTB.register(UINib(nibName: "\(UserTBCell.self)", bundle: nil), forCellReuseIdentifier: "UserTBCell")
            albumListTB.register(UINib(nibName: "\(AlbumListHeader.self)", bundle: nil), forHeaderFooterViewReuseIdentifier: "AlbumListHeader")
        }
    }
    @Published var viewModel = AlbumViewModel()
    @Published  var albums: [Album]?
    @Published var user: User?
    var cancellables = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Profile"
        
        viewModel.chainApiCall().sink(receiveCompletion: { complation in
            switch complation{
            case .failure(let error):
                print("Error is \(error.localizedDescription)")
            case .finished:
                print("finished")
            }
        }, receiveValue: { albums in
            self.albums = albums
            self.user = self.viewModel.user
            DispatchQueue.main.async {
                self.albumListTB.reloadData()
            }
            
        }).store(in: &cancellables)
        
        
    }
    func requestMoya(){
        viewModel.loadUsers().sink (receiveCompletion:{  complation in
            switch complation{
            case .failure(let error):
                print("Error is \(error.localizedDescription)")
            case .finished:
                print("finished")
            }
        } ,receiveValue: { response in
            self.user = try? JSONDecoder().decode([User].self, from: response.data).randomElement()!
            
            self.albumListTB.reloadData()
            
        }).store(in: &cancellables)
    }
}
