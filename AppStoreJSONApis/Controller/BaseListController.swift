//
//  BaseListController.swift
//  AppStoreJSONApis
//
//  Created by Mai Le Duong on 7/25/19.
//  Copyright © 2019 Mai Le Duong. All rights reserved.
//

import UIKit

class BaseListController: UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
