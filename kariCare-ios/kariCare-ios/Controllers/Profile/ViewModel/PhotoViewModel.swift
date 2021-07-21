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
    var shouldShowLoadingCell = false
    private var currentPage = 1
    
    
    init(delegate: DataFetchedDelegate?, webService: ApiService ) {
        self.delegate = delegate
        self.webService = webService
        getPhotoList()
    }
    
    var numberOfItems: Int {
        let count = photoList.count
        return shouldShowLoadingCell ? count + 1 : count
    }

    
    private func getPhotoList(refresh: Bool = false){
        webService.getPhotos(for: currentPage){ [weak self] response in
            switch response{
            case .failure(let error):
                self?.delegate?.onFetchError(error: error)
            case .success(let photoList):
                // 1
                self?.currentPage += 1
                self?.photoList = photoList
                self?.delegate?.onDataFetched()
            }
        }
    }
    
    func isLoadingIndexPath(_ indexPath: IndexPath)-> Bool{
        guard shouldShowLoadingCell else { return false}
        return indexPath.row == self.photoList.count
    }
    
}
