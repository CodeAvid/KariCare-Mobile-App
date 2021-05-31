//
//  Contants.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 28/05/2021.
//

import Foundation


struct Constants {
    struct TabIcon {
        static var home = "house"
        static var message = "message"
        static var add = "plus"
        static var bell = "bell"
        static var person = "person"
        
    }
    
    struct Colors {
        static var bgColor = "bgColor"
        static var greyColor = "greyColor"
        static var peachColor  = "peachColor"
    }
    
    struct Images {
        static var profileImage = "profileImage"
    }
    
    struct ApiServiceUrl{
        static var page1 = "https://api.unsplash.com/photos/?client_id=TOCnwUYSNssEFuqTc-nrr9W50ONTeLfn1G8W4dyD_to&page=1"
        
        static var page2 = "https://api.unsplash.com/photos/?client_id=TOCnwUYSNssEFuqTc-nrr9W50ONTeLfn1G8W4dyD_to&page=2"
        
        static var page3 = "https://api.unsplash.com/photos/?client_id=TOCnwUYSNssEFuqTc-nrr9W50ONTeLfn1G8W4dyD_to&page=3"
    }
    
    struct HttpErrorMessage {
        static let notJson =  "Response not in JSON format"
        static let badRequest = "BadRequest"
        static let serverError = "ServerError"
    }
    
    
    struct HomeVC {
        static var title = "Discover"
        static var bookmark = "bookmark.fill"
        static var more = "ellipsis"
        static var likes = "heart.fill"
        static var comment = "message.fill"
        static var reply = "arrowshape.turn.up.forward.fill"
    }
    
    struct LiveBadgeView {
        static var title = "LIVE"
        static var icon = "video.fill"
    }
    
    
    struct ProfileVc {
        static var title = "My profile"
        static var name = "Anna Karenina"
        static var location = "University of Lagos \n Lagos, Nigeria"
        static var photoCaption = "Photos"
        static var followersCaption  = "Followers"
        static var followingCaption  = "Following"
        static var defaulttotalPhotos = String(0)
        static var defaultNumberOfFollowers = String(146)
        static var defaultNumberOfPeopleFollowing = String(204)
    }
}
