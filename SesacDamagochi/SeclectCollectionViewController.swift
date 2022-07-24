//
//  SeclectCollectionViewController.swift
//  SesacDamagochi
//
//  Created by Doy Kim on 2022/07/24.
//

import UIKit


class SeclectCollectionViewController: UICollectionViewController {
    // MARK: - Properties
    static let identifier = "SeclectCollectionViewController"

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    // MARK: - Actions, Helpers
    
    func configure(){
        self.view.backgroundColor = UIColor.DamagochiBackgroundColor
        
    }
    
    
    
    
    // MARK: - CollectionView Initialise
    
    // - 섹션 개수
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // - 아이템 개수
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    // - 셀 디자인
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectCollectionViewCell.identifier, for: indexPath) as? SelectCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
    
   
    
}


// - 셀 사이즈

extension SeclectCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let inset: CGFloat = 20
        let spacing: CGFloat = 20
        
        let width: CGFloat = (UIScreen.main.bounds.width - inset*2 - spacing*2 )/3
        
        let height: CGFloat = width +
        36
        return CGSize(width: width, height: height)
    }
}
