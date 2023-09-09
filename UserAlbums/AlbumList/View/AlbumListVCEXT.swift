//
//  AlbumListVCEXT.swift
//  UserAlbums
//
//  Created by Asmaa_Abdelfattah on 16/06/1402 AP.
//

import UIKit
extension AlbumListVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 1 :
            guard let section =  Bundle.main.loadNibNamed("AlbumListHeader", owner: self, options: nil)?.last as? AlbumListHeader else {
                return UIView()
            }
            section.sectionTitle.text = "My Albums"
            return section
        default:
            return UIView()
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section{
        case 1:
            return CGFloat(75)
        default:
            return CGFloat(0)
        }
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return 1
        case 1:
            return albums?.count ?? 0
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            guard let userCell = tableView.dequeueReusableCell(withIdentifier: "UserTBCell", for: indexPath) as? UserTBCell else{
                return UITableViewCell()
            }
            userCell.userNameLabel.text = user?.name
            userCell.userAddressLabel.text = "" + (user?.address.street ?? "") + " , " + (user?.address.suite ?? "")
            userCell.userAddressLabel.text?.append(" , " + (user?.address.city ?? "") + " ,\n" + (user?.address.zipcode ?? ""))
         
            return userCell
        case 1 :
            guard let albumCell = tableView.dequeueReusableCell(withIdentifier: "AlbumListTBCell", for: indexPath) as? AlbumListTBCell else{
                return UITableViewCell()
            }
            albumCell.albumName.text = albums?[indexPath.row].title
            
            return albumCell
        default:
            return UITableViewCell()
        }
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            let storyboard = UIStoryboard(name: "AlbumDetails", bundle: nil)
            guard let detailVC = storyboard.instantiateViewController(withIdentifier: "details") as? AlbumDetailsVC else {return }
            detailVC.albumTitle = albums?[indexPath.row].title
            detailVC.albumId = albums?[indexPath.row].id
            navigationController?.pushViewController(detailVC, animated: true)
        default:
            return
        }
    }
    
}
