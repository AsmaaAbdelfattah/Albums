//
//  AlbumData.swift
//  UserAlbums
//
//  Created by Asmaa_Abdelfattah on 16/06/1402 AP.
//

import Foundation
import Moya
enum services{
    case users
    case albums(userId: Int)
    case photos(albumId: Int)
}
extension services: TargetType{
    var headers: [String : String]? {
        [ "Content-type": "application/json; charset=UTF-8" ]
    }
    
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    var path: String {
        switch self{
        case .users:
            return "/users"
        case .albums(let userId):
            return "/users/\(userId)/albums"
        case .photos(let albumId):
            return "/albums/\(albumId)/photos"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Moya.Task {
        .requestPlain
    }

}
