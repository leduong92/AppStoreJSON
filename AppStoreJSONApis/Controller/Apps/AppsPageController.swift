//
//  AppsController.swift
//  AppStoreJSONApis
//
//  Created by Mai Le Duong on 7/25/19.
//  Copyright © 2019 Mai Le Duong. All rights reserved.
//

import UIKit

class AppsPageController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "id"
    let headerId = "headerId"
    
    
    let activityIndicatorView: UIActivityIndicatorView = {
       let aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.color = .black
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let redController = UIViewController()
//        redController.view.backgroundColor = .red
//        navigationController?.pushViewController(redController, animated: true)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
        //1
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        view.addSubview(activityIndicatorView)
        activityIndicatorView.fillSuperview()
        fetchData()
    }
    
//    var editorsChoiceGames: AppGroup?
    
    var groups = [AppGroup]()
    
    var socialApps = [SocialApp]()
    
    fileprivate func fetchData() {
        print("Fetching data...")
        
        var group1: AppGroup?
        var group2: AppGroup?
        var group3: AppGroup?
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchGames { (appGroup, err) in
            if let err = err {
                print("Failed to fetch games:", err)
                return
            }
            
            //            self.editorsChoiceGames = appGroup
            
            dispatchGroup.leave()
//            if let group = appGroup {
//                self.groups.append(group)
//            }
            group1 = appGroup
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
        }
        
        
        dispatchGroup.enter()
        Service.shared.fetchTopGrossing { (appGroup, err) in
            
            dispatchGroup.leave()
            group2 = appGroup
//            if let group = appGroup {
//                self.groups.append(group)
//            }
//
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
        }
        dispatchGroup.enter()
        Service.shared.fetchTopFree { (appGroup, err) in
            dispatchGroup.leave()
            group3 = appGroup
//            if let group = appGroup {
//                self.groups.append(group)
//            }
//
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
        }
        dispatchGroup.enter()
        Service.shared.fetchSocialApps { (apps, err) in
            if let err = err {
                print("Failed to fetch games:", err)
                return
            }
            
            
//            apps?.forEach({ print($0.name)})
            dispatchGroup.leave()
            self.socialApps = apps ?? []
        }
        //completion
        dispatchGroup.notify(queue: .main) {
            print("Ok ne")
            
            self.activityIndicatorView.stopAnimating()
            
            if let group = group1 {
                self.groups.append(group)
            }
            if let group = group2 {
                self.groups.append(group)
            }
            if let group = group3 {
                self.groups.append(group)
            }
            self.collectionView.reloadData()
        }
    }
    //2
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsPageHeader
        header.appHeaderHorizontalController.socials = self.socialApps
        header.appHeaderHorizontalController.collectionView.reloadData()
        return header
    }
    //3
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
        
        let appGroups = groups[indexPath.item]
        cell.titleLabel.text = appGroups.feed.title
        cell.horizontalController.appGroup = appGroups
        cell.horizontalController.collectionView.reloadData()
        cell.horizontalController.didSelectHandler = { [weak self]feedResult in
            
            let controller = AppDetailController(appId: feedResult.id)
//            controller.appId = feedResult.id
            controller.navigationItem.title = feedResult.name
            self?.navigationController?.pushViewController(controller, animated: true)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
}
