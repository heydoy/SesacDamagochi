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
        UserDefaultsManager.status = .edit
        
        if let id = damagochi?.id {
            UserDefaultsManager.SelectedDamagochiId = id
        } else { print("선택된 다마고치 아이디 저장 오류")}
        
        // - 화면전환
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: DamagochiMainViewController.identifier) as! DamagochiMainViewController
        
        let nav = UINavigationController(rootViewController: vc)
        
        nav.modalPresentationStyle = .fullScreen
        nav.modalTransitionStyle = .crossDissolve
        
        
        // -- 윈도우 루트뷰로 바꿔서 쌓인 화면 제거 
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        sceneDelegate?.window?.rootViewController = nav
        
        self.present(nav, animated: true)
        

        
    }
    
    
    // MARK: - Helpers
    
    // 디자인
    func configure() {
        
        // 팝업 레이어 둥글리기
        popupView.clipsToBounds = true
        popupView.layer.cornerRadius = 12
        popupView.backgroundColor = .damagochiBackgroundColor
        
        // 이미지 레이어
        //imageView.layer.cornerRadius = imageView.frame.width/2
        
        // 글자 및 버튼글자 색상
        titleLabel.textColor = .damagochiFontAndBorderColor
        titleLabel.font = .customFont(size: 12)
        overviewLabel.textColor = .damagochiFontAndBorderColor
        titleLabel.layer.cornerRadius = 8
        titleLabel.layer.borderWidth = 1
        titleLabel.layer.borderColor = UIColor.damagochiFontAndBorderColor.cgColor
        
        
        // 버튼
        // - 버튼은 조건따라 시작하기 또는 변경하기로 바꾸어야함
        switch UserDefaultsManager.status {
        case .start :
            // 다마고치를 선택한 적 없다면
            // 네비게이션 컨트롤러 설정
            self.startButtonLabel = "시작하기"
            
        case .edit :
            // 다마고치가 선택됐다면
            // 네비게이션 컨트롤러 설정
            self.startButtonLabel = "변경하기"
        }

        cancelButton.setTitle("취소", for: .normal)
        cancelButton.backgroundColor = UIColor.systemGray5
        cancelButton.tintColor = .damagochiFontAndBorderColor
        
        startButton.setTitle("\(startButtonLabel)", for: .normal)
        startButton.tintColor = .damagochiFontAndBorderColor
    }

    // 내용
    func dataConfigure() {
        imageView.image = UIImage(named: damagochi?.thumnailImage ?? "")
        titleLabel.text = damagochi?.name
        overviewLabel.text = damagochi?.overview
        
    }

}
