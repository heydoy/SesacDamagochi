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
    
    var startButtonLabel = ""
    var damagochi: Damagochi?
    
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
        dataConfigure()
    }
    
    // MARK: - Actions
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 선택완료 설정 후, 다마고치 선택된 아이디 설정, 화면 전환
        UserDefaultsManager.isDamagochiSelected = true
        
        if let id = damagochi?.id {
            UserDefaultsManager.SelectedDamagochiId = id
        } else { print("선택된 다마고치 아이디 저장 오류")}
        
        // - 화면전환
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: DamagochiMainViewController.identifier) as! DamagochiMainViewController
        
        let nav = UINavigationController(rootViewController: vc)
        
        nav.modalPresentationStyle = .fullScreen
        nav.modalTransitionStyle = .crossDissolve
        
        self.present(nav, animated: true)
        
        
    }
    
    
    // MARK: - Helpers
    
    // 디자인
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
        cancelButton.tintColor = .DamagochiFontAndBorderColor
        
        startButton.setTitle("\(startButtonLabel)", for: .normal)
        startButton.tintColor = .DamagochiFontAndBorderColor
    }

    // 내용
    func dataConfigure() {
        imageView.image = UIImage(named: damagochi?.thumnailImage ?? "")
        titleLabel.text = damagochi?.name
        overviewLabel.text = damagochi?.overview
        
    }

}
