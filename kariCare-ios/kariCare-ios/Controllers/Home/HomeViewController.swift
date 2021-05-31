//
//  ViewController.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 28/05/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    enum Section: Int, CaseIterable{
        case activeUser
        case feed
    }
    
    struct CategorizePhotos: Hashable {
        let photo: Photo
        let category: Section
    }
    
    lazy private var viewModel = HomeViewModel(delegate: self, webService: ApiService())
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        indicator.startAnimating()
        return indicator
    }()
    
    lazy var dataSource = createDataSource()
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Photo>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Photo>
    
    private var homeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configureCollectionView()
        applySnapshot(animatingDifferences: false)
    }
}


//MARK:- Configure UICollectionView

extension HomeViewController{
    func configureCollectionView() {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCollectionViewLayout())
        view.addSubview(collectionView)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = UIColor(named: Constants.Colors.bgColor)
        collectionView.addSubview(activityIndicator)
        activityIndicator.centerInSuperview()
        collectionView.register(StoryCell.self)
        collectionView.register(FeedCell.self)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(HomeHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeHeaderView.reuseIdentifier)
        homeCollectionView = collectionView
      
    }
}


//MARK:- Create UICollectionView Data Source

extension HomeViewController{
    func createDataSource() -> DataSource {
        let dataSource = DataSource(
            collectionView: homeCollectionView,
            cellProvider: { (collectionView, indexPath, photo) ->
                UICollectionViewCell? in
                let sectionType = Section.allCases[indexPath.section]
                switch sectionType{
                case .activeUser:
                    let cell : StoryCell = collectionView.dequeueReusableCell(for: indexPath)
                    cell.configureCell(with: photo)
                    return cell
                case .feed:
                    let cell : FeedCell = collectionView.dequeueReusableCell(for: indexPath)
                    cell.configureCell(with: photo)
                    return cell
                }
            })
        
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            
            guard kind == UICollectionView.elementKindSectionHeader else {
                return nil
            }
            let view = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HomeHeaderView.reuseIdentifier,
                for: indexPath) as? HomeHeaderView
            
            return view
        }
        
        return dataSource
    }
}


//MARK:- Create Snapshot

extension HomeViewController{
    func applySnapshot(animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(viewModel.page2Photos, toSection: Section.activeUser)
        snapshot.appendItems(viewModel.page3Photos, toSection: Section.feed)
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
}

//MARK:- Create Active User Section

extension HomeViewController{
    func createActiveUserSection() -> NSCollectionLayoutSection{
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        item.contentInsets.trailing = 20
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.4), heightDimension: .absolute(150)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .continuous
        
        section.contentInsets = .init(top: 20, leading: 20, bottom: 20, trailing: 20)
        
        let headerFooterSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(200)
        )
        
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerFooterSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
    }
}

//MARK:- Create Feed Section

extension HomeViewController{
    func createFeedSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets.leading = 20
        item.contentInsets.bottom = 20
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(300)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 20, leading: 0, bottom: 20, trailing: 20)
        
        return section
    }
}

//MARK:- Create UICollectionView Layout

extension HomeViewController: UICollectionViewDelegate {
    
    func createCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex,  _ ) in
            let sectionLayoutKind = Section.allCases[sectionIndex]
            switch sectionLayoutKind{
            case .activeUser:
                return self.createActiveUserSection()
            case .feed:
                return self.createFeedSection()
            }
        }
        return layout
    }
}

//MARK:- Implement Data FetchedDelegate

extension HomeViewController: DataFetchedDelegate{
    func onDataFetched() {
        DispatchQueue.main.async {[weak self] in
            self?.homeCollectionView?.reloadData()
            self?.activityIndicator.stopAnimating()
            self?.applySnapshot()
        }
        
    }
    
    func onFetchError(error: Error) {
        DispatchQueue.main.async {[weak self] in
            self?.showAlert(title: "Oops! An error has occured", message: error.localizedDescription)
        }
        
    }
    
}
