//
//  DetailPopupViewController.swift
//  SesacDamagochi
//
//  Created by Doy Kim on 2022/07/24.
//

import UIKit

class DetailPopupViewController: UIViewController {
    // MARK: - Properties
    static let identifier = "DetailPopupViewController"
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var borderBetweenLabels: UIView!
    @IBOutlet weak var borderAboveButtons: UIView!
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK: - Actions
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
    
    // MARK: - Helpers
    
    func configure() {
        
        // 팝업 레이어 둥글리기
        popupView.clipsToBounds = true
        popupView.layer.cornerRadius = 12
        popupView.backgroundColor = UIColor.DamagochiBackgroundColor
        
        // 이미지 레이어
        imageView.layer.cornerRadius = imageView.frame.width/2
        
        // 글자 및 버튼글자 색상
        titleLabel.textColor = UIColor.DamagochiFontAndBorderColor
        overviewLabel.textColor = UIColor.DamagochiFontAndBorderColor
        
        
        // 버튼
        // - 버튼은 조건따라 시작하기 또는 변경하기로 바꾸어야함
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.backgroundColor = UIColor.systemGray5
        
        startButton.setTitle("시작하기", for: .normal)
    }


}
