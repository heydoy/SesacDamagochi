//
//  SelectCollectionViewCell.swift
//  SesacDamagochi
//
//  Created by Doy Kim on 2022/07/24.
//

import UIKit

class SelectCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "SelectCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    // MARK: - Actions, Helper
    func configure(_ damagochi: Damagochi) {
        // 디자인
        titleLabel.text = damagochi.name
        imageView.image = UIImage(named: damagochi.thumnailImage)
    }
    
}
