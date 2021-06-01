//
//  ApiServices.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 29/05/2021.
//

import Foundation

class ApiService: WebService{
    
    let networkManager = NetworkManager()
    
    func getPhotos(for pageIndex: Int, completion: @escaping (Result<PhotoList, Error>)-> ()){
        
        let url = Constants.ApiServiceUrl.page + String(pageIndex)
        
        networkManager.makeRequest(requestType: .get, url: url, params: nil, completionHandler: completion)
    }
    
}
