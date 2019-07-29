//
//  AppsHorizontalController.swift
//  AppStoreJSONApis
//
//  Created by Mai Le Duong on 7/25/19.
//  Copyright © 2019 Mai Le Duong. All rights reserved.
//

import UIKit

class AppsHorizontalController: HorizontalSnappingController , UICollectionViewDelegateFlowLayout{
    
    let cellId = "cellId"
    
    var appGroup: AppGroup?
    
    
    var didSelectHandler: ((FeedResult) -> ())?
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if  let app = appGroup?.feed.results[indexPath.item] {
             didSelectHandler?(app)
        }
//        print(app?.name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(AppRowCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appGroup?.feed.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppRowCell
//        cell.backgroundColor = .red
        let app = appGroup?.feed.results[indexPath.row]
        cell.nameLabel.text = app?.name
        cell.companyLabel.text = app?.artistName
//        cell.imageView.image = app?.artworkUrl100
        cell.imageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
        return cell
    }
    
    let topBottomPadding: CGFloat = 12
    let lineSpacing: CGFloat = 10
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - 2 * topBottomPadding - 2 * lineSpacing) / 3
        return .init(width: view.frame.width - 48, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return .init(top: topBottomPadding, left: lineSpacing, bottom: topBottomPadding, right: lineSpacing)
        return .init(top: topBottomPadding, left: 0, bottom: topBottomPadding, right: 0)
    }
    
}
