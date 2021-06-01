//
//  kariCareConstantCheck.swift
//  kariCareConstantCheck
//
//  Created by akhigbe benjamin on 31/05/2021.
//

import XCTest

@testable import kariCare_ios

class kariCareConstantCheck: XCTestCase {
    
    var sut = kariCare_ios.Constants.self
    
    override func setUpWithError() throws {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
   
    func testConstant() throws {
        
        XCTAssertEqual("house", sut.TabIcon.home)
        XCTAssertEqual("message", sut.TabIcon.message)
        XCTAssertEqual("plus", sut.TabIcon.add)
        XCTAssertEqual("bell", sut.TabIcon.bell)
        XCTAssertEqual("person", sut.TabIcon.person)
        XCTAssertEqual("bgColor", sut.Colors.bgColor)
        
        XCTAssertEqual("greyColor", sut.Colors.greyColor)
        
        XCTAssertEqual("peachColor", sut.Colors.peachColor)
        
        XCTAssertEqual("profileImage", sut.Images.profileImage)
        
        
        XCTAssertEqual("https://api.unsplash.com/photos/?client_id=TOCnwUYSNssEFuqTc-nrr9W50ONTeLfn1G8W4dyD_to&page=", sut.ApiServiceUrl.page)
        
        XCTAssertEqual("Response not in JSON format", sut.HttpErrorMessage.notJson)
        
        XCTAssertEqual("BadRequest", sut.HttpErrorMessage.badRequest)
        
        XCTAssertEqual("ServerError", sut.HttpErrorMessage.serverError)
        
        XCTAssertEqual("Discover", sut.HomeVC.title)
        
        XCTAssertEqual("bookmark.fill", sut.HomeVC.bookmark)
        
        XCTAssertEqual("ellipsis", sut.HomeVC.more)
        
        XCTAssertEqual("heart.fill", sut.HomeVC.likes)
        
        XCTAssertEqual("message.fill", sut.HomeVC.comment)
        
        XCTAssertEqual("arrowshape.turn.up.forward.fill", sut.HomeVC.reply)
        
        XCTAssertEqual("LIVE", sut.LiveBadgeView.title)
        
        XCTAssertEqual("video.fill", sut.LiveBadgeView.icon)
        
        XCTAssertEqual("My profile", sut.ProfileVc.title)
        
        XCTAssertEqual("Anna Karenina", sut.ProfileVc.name)
        
        XCTAssertEqual("University of Lagos \n Lagos, Nigeria", sut.ProfileVc.location)
        
        XCTAssertEqual("Photos", sut.ProfileVc.photoCaption)
        
        XCTAssertEqual("Followers", sut.ProfileVc.followersCaption)
        
        XCTAssertEqual("Following", sut.ProfileVc.followingCaption)
        
        XCTAssertEqual("0", sut.ProfileVc.defaulttotalPhotos)
        
        XCTAssertEqual("146", sut.ProfileVc.defaultNumberOfFollowers)
        
        XCTAssertEqual("204", sut.ProfileVc.defaultNumberOfPeopleFollowing)
    }

}
