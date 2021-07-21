//
//  Photo.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 29/05/2021.
//

import Foundation

typealias PhotoList = [Photo]

struct Photo: Codable, Hashable{
    
    
    let id: String?
    let getPhotoDescription: String?
    let urls: Urls?
    let likes: Int?
    let user: User?

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Photo, rhs: Photo) -> Bool {
        lhs.id == rhs.id
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case getPhotoDescription = "description"
        case urls
        case likes
        case user
    }
    
}


struct User: Codable {
    let id: String?
    let firstName: String?
    let lastName: String?
    let bio, location: String?
    let profileImage: ProfileImage?
    let totalCollections, totalLikes, totalPhotos: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case bio, location
        case profileImage = "profile_image"
        case totalCollections = "total_collections"
        case totalLikes = "total_likes"
        case totalPhotos = "total_photos"

    }
}
struct ProfileImage: Codable {
    let medium: String?
}

struct Urls: Codable {
    let small: String
}

