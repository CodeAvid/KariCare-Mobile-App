//
//  PhotoViewModel.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 29/05/2021.
//

import UIKit


class PhotoViewModel{
    
    let delegate: DataFetchedDelegate?
    var webService : ApiService
    var photoList = [Photo]()
    
    init(delegate: DataFetchedDelegate?, webService: ApiService ) {
        self.delegate = delegate
        self.webService = webService
        getPhotoList()
    }
    
    private func getPhotoList(){
        webService.getPhotos { [weak self] response in
            switch response{
            case .success(let photoList):
                self?.photoList = photoList
                self?.delegate?.onDataFetched()
            case .failure(let error):
                self?.delegate?.onFetchError(error: error)
            }
        }
    }
    
}
