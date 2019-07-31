//
//  BackEnableNavigationController.swift
//  AppStoreJSONApis
//
//  Created by Mai Le Duong on 7/31/19.
//  Copyright © 2019 Mai Le Duong. All rights reserved.
//

import UIKit

class BackEnabledNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.interactivePopGestureRecognizer?.delegate = self //set nut back quay lai
    }
    //2 viewcontroller se co thuoc tinh nay
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.viewControllers.count > 1 //
    }
    
}
