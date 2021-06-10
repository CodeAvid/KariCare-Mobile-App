//
//  ProfileViewController.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 28/05/2021.
//

import UIKit

class ProfileViewController: UIViewController{
    
    enum Section {
        case main
    }
    
    lazy var viewModel = PhotoViewModel(delegate: self, webService: ApiService())
    
    lazy var dataSource = createDataSource()
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Photo>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Photo>
    
    var ProfileCollectionView: UICollectionView! = nil

    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        indicator.startAnimating()
        return indicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
}

//MARK:- Configure UICollectionView

extension ProfileViewController{
    func configureCollectionView() {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCollectionViewLayout())
        view.addSubview(collectionView)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = UIColor(named: Constants.Colors.bgColor)
        collectionView.addSubview(activityIndicator)
        activityIndicator.centerInSuperview()
        collectionView.register(PhotoCell.self)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ProfileHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileHeaderView.reuseIdentifier)
        ProfileCollectionView = collectionView
        applySnapshot()
    }
}

//MARK:- Create UICollectionView Data Source

extension ProfileViewController{

    func createDataSource() -> DataSource {
        let dataSource = DataSource(
            collectionView: ProfileCollectionView,
            cellProvider: { (collectionView, indexPath, photo) ->
                UICollectionViewCell? in
                let cell : PhotoCell = collectionView.dequeueReusableCell(for: indexPath)
                cell.photo = photo
                return cell
            })
        
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
        
            guard kind == UICollectionView.elementKindSectionHeader else {
                return nil
            }
            
            let view = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: ProfileHeaderView.reuseIdentifier,
                for: indexPath) as? ProfileHeaderView
            
            view?.update(totalPhotos: self.viewModel.photoList.count)
            return view
        }
        
        return dataSource
    }
}

//MARK:- Create  Snapshot

extension ProfileViewController{
    func applySnapshot(animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel.photoList)
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
    
}

//MARK:- Create UICollectionView Layout

extension ProfileViewController{
    
    func createCollectionViewLayout() -> UICollectionViewLayout {
        
        // Main with pair
        let mainItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalHeight(1.0)))
        
        mainItem.contentInsets.trailing = 20
        mainItem.contentInsets.bottom = 20
        
        let pairItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.5)))
        
        pairItem.contentInsets.bottom = 20
        
        let trailingGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalHeight(1.0)),
            subitem: pairItem,
            count: 2)
        
        let mainWithPairGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.4)),
            subitems: [mainItem, trailingGroup])
        
        mainWithPairGroup.contentInsets = .init(top: 20, leading: 20, bottom: 0, trailing: 20)
        
        let section = NSCollectionLayoutSection(group: mainWithPairGroup)
        
        let headerFooterSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(250)
        )
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerFooterSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        section.boundarySupplementaryItems = [sectionHeader]
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

//MARK:- Implement Data FetchedDelegate

extension ProfileViewController: DataFetchedDelegate, UICollectionViewDelegate{
    func onDataFetched() {
        DispatchQueue.main.async {[weak self] in
            self?.applySnapshot()
            self?.activityIndicator.stopAnimating()
        }
        
    }
    
    func onFetchError(error: Error) {
        DispatchQueue.main.async {[weak self] in
            self?.showAlert(title: "Oops! An error has occured", message: error.localizedDescription)
        }
        
    }
    
}
