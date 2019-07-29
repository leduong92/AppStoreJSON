//
//  AppDetailCell.swift
//  AppStoreJSONApis
//
//  Created by Mai Le Duong on 7/28/19.
//  Copyright © 2019 Mai Le Duong. All rights reserved.
//

import UIKit

class AppDetailCell: UICollectionViewCell {
    
    var app: Result! {
        didSet {
            appiconImageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))
            nameLabel.text = app?.trackName
            releaseNotesLabel.text = app?.releaseNotes
            priceButton.setTitle(app?.formattedPrice, for: .normal)
        }
    }
    
    let appiconImageView = UIImageView(cornerRadius: 16)
    let nameLabel = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 24), numberOfLines: 2)
    let priceButton = UIButton(title: "$4.99")
    let whatsNewLabel = UILabel(text: "What's News", font: .boldSystemFont(ofSize: 20))
    let releaseNotesLabel = UILabel(text: "Release Notes", font: .systemFont(ofSize: 18), numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        appiconImageView.backgroundColor = .red
        
        appiconImageView.constrainWidth(constant: 140)
        appiconImageView.constrainHeight(constant: 140)
        
        priceButton.backgroundColor = #colorLiteral(red: 0.1217255518, green: 0.5269078016, blue: 0.7757787108, alpha: 1)
        priceButton.constrainHeight(constant: 32)
        priceButton.layer.cornerRadius = 32 / 2
        priceButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        priceButton.setTitleColor(.white, for: .normal)
        priceButton.constrainWidth(constant: 80)
        
        let stackView = VerticalStackView(arrangedSubViews: [
            UIStackView(arrangedSubviews: [appiconImageView,
                                           VerticalStackView(arrangedSubViews: [
                                            nameLabel,
                                            UIStackView(arrangedSubviews: [priceButton, UIView()]),
                                            UIView()
                                            ], spacing: 12)
                ], customSpacing: 20),
            whatsNewLabel,
            releaseNotesLabel
            ], spacing: 16)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension UIStackView {
    convenience init(arrangedSubviews: [UIView], customSpacing: CGFloat = 0) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.spacing = customSpacing
    }
}
