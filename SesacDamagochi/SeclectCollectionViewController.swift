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
    
    var damagochis = Damagochis()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configure()
        
        // 네비게이션 컨트롤러 설정
        self.navigationItem.title = "다마고치 선택하기"

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
        

        cell.configure(indexPath.item)
        
        return cell
    }
    
    // - 셀을 선택했을 때
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 팝업 띄우기
        print(indexPath.item)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: DetailPopupViewController.identifier) as! DetailPopupViewController
        
        vc.modalPresentationStyle = .overCurrentContext
        
        vc.modalTransitionStyle = .crossDissolve
        
        self.present(vc, animated: true, completion: nil)
        
        
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
