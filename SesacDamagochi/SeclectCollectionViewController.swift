//
//  SeclectCollectionViewController.swift
//  SesacDamagochi
//
//  Created by Doy Kim on 2022/07/24.
//

import UIKit
import Toast


class SeclectCollectionViewController: UICollectionViewController {
    // MARK: - Properties
    static let identifier = "SeclectCollectionViewController"
    
    
    //let damagochis = UserDefaultsManager.damagochiList
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK: - Actions, Helpers
    
    func configure(){
        
        collectionView.backgroundColor = UIColor.DamagochiBackgroundColor
        
        if UserDefaultsManager.isDamagochiSelected {
            // 다마고치가 선택됐다면
            // 네비게이션 컨트롤러 설정
            self.navigationItem.title = "다마고치 변경하기"
            
        } else {
            // 다마고치를 선택한 적 없다면
            // 네비게이션 컨트롤러 설정
            self.navigationItem.title = "다마고치 선택하기"
        }

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
        
        if (0...2).contains(indexPath.item)  {
            cell.configure(UserDefaultsManager.damagochiList[indexPath.item])
        } else {
            cell.configure(UserDefaultsManager.damagochiList[3])
        }
        
        
        return cell
    }
    
    // - 셀을 선택했을 때
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 팝업 띄우기
        print(indexPath.item)
        
        if (0...2).contains(indexPath.row) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let vc = storyboard.instantiateViewController(withIdentifier: DetailPopupViewController.identifier) as! DetailPopupViewController
            
            vc.modalPresentationStyle = .overCurrentContext
            
            vc.modalTransitionStyle = .crossDissolve
            
            if UserDefaultsManager.isDamagochiSelected {
                // 다마고치가 선택됐다면
                vc.startButtonLabel = "변경하기"
                
            } else {
                // 다마고치를 선택한 적 없다면
                vc.startButtonLabel = "시작하기"
            }
            
           
            vc.damagochi = UserDefaultsManager.damagochiList[indexPath.item]
            
            
            self.present(vc, animated: true, completion: nil)
        } else {
            // 아직 준비중인 셀들
            self.view.makeToast("아직 준비중이라 선택할 수 없어요")
        }
        
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
