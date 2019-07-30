//
//  AppFullscreenController.swift
//  AppStoreJSONApis
//
//  Created by Mai Le Duong on 7/30/19.
//  Copyright © 2019 Mai Le Duong. All rights reserved.
//

import UIKit

class AppFullscreenController: UITableViewController {
    
    var dismissHandler: (() ->())? //invoke dismiss qa day
    var todayItem: TodayItem?  //lay du lieu
    
    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView() //bo cac line khong dung o tableview
        tableView.separatorStyle = .none
        tableView.allowsSelection = false //cho phep click vao table view
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 { //top section
            let headerCell = AppFullscreenHeaderCell()
            headerCell.closeButton.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
            headerCell.todayCell.todayItem = todayItem //fix todaycell image luc click vao cell  hinh khong render
            return headerCell
        }
        let cell = AppFullscreenDescriptionCell() //
        return cell
    }
    
    @objc fileprivate func handleDismiss(button: UIButton) { //dismiss tableview contrller
        button.isHidden = true
        dismissHandler?()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 450
        }
        return super.tableView(tableView, heightForRowAt: indexPath) //fix jumpy khi tapdismis
    }
 
}
