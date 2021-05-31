//
//  HomeViewModel.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 29/05/2021.
//

import Foundation

struct Pages {
    var page2 = [Photo]()
    var page3  = [Photo]()
}


class HomeViewModel{
    
    
    let delegate: DataFetchedDelegate?
    var webService: ApiService
    var pages: Pages?
    var page2Photos = [Photo]()
    var page3Photos = [Photo]()
    
    let dispatchGroup = DispatchGroup()
    
    init(delegate: DataFetchedDelegate?, webService: ApiService ) {
        self.delegate = delegate
        self.webService = webService
        
        getPages()
    }
    
    private func getPages(){
        
        dispatchGroup.enter()
        webService.getPage2Photos { [weak self] response in
            switch response{
            case .success(let photoList):
                self?.page2Photos = photoList
                self?.dispatchGroup.leave()
            case .failure(let error):
                self?.dispatchGroup.leave()
                self?.delegate?.onFetchError(error: error)
            }
        }
        dispatchGroup.enter()
        
        webService.getPage3Photos { [weak self] response in
            switch response{
            case .success(let photoList):
                self?.page3Photos = photoList
                self?.dispatchGroup.leave()
            case .failure(let error):
                self?.delegate?.onFetchError(error: error)
                self?.dispatchGroup.leave()
            }
        }
        
        
        dispatchGroup.notify(queue: .main) { [weak self ] in
        
            if let page2 = self?.page2Photos, let page3 = self?.page2Photos{
                self?.pages = Pages(page2: page2, page3: page3)
            }
            
            self?.delegate?.onDataFetched()
        }
        
        
    }
    
    
}


