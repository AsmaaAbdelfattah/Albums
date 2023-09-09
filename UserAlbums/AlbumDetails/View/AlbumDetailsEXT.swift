//
//  AlbumDetailsEXT.swift
//  UserAlbums
//
//  Created by Asmaa_Abdelfattah on 17/06/1402 AP.
//

import UIKit
import Kingfisher
extension AlbumDetailsVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCVCell", for: indexPath) as? PhotosCVCell else{
            return UICollectionViewCell()
        }
       photoCell.photo.kf.setImage(
        with: URL(string: photos[indexPath.row].url),
        placeholder: UIImage(named: photos[indexPath.row].thumbnailUrl))
        return photoCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 3)  , height: (collectionView.frame.height / 4) - 20)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(0)
    }
}
