//
//  ApiServices.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 29/05/2021.
//

import Foundation

class ApiService: WebService{
    
   
    
    let networkManager = NetworkManager()
    
    func getPhotos(completion: @escaping (Result<PhotoList, Error>)-> ()){
        
        networkManager.makeRequest(requestType: .get, url: Constants.ApiServiceUrl.page1, params: nil, completionHandler: completion)
    }
    
    func getPage2Photos(completion: @escaping (Result<PhotoList, Error>)-> ()){
        
        networkManager.makeRequest(requestType: .get, url: Constants.ApiServiceUrl.page2, params: nil, completionHandler: completion)
    }
    
    func getPage3Photos(completion: @escaping (Result<PhotoList, Error>)-> ()){
        
        networkManager.makeRequest(requestType: .get, url: Constants.ApiServiceUrl.page3, params: nil, completionHandler: completion)
    }
    
}
