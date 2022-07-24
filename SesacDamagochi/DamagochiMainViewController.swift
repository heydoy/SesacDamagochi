//
//  DamagochiMainViewController.swift
//  SesacDamagochi
//
//  Created by Doy Kim on 2022/07/24.
//

import UIKit
import Toast

class DamagochiMainViewController: UIViewController {
    // MARK: - Properties
    static let identifier = "DamagochiMainViewController"
    let bossName = "대장" // 이름은 나중에 변경할 수 있어야함
    
    // - Outlet
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var dialogueLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var riceTextField: UITextField!
    @IBOutlet weak var waterTextField: UITextField!
    
    @IBOutlet weak var riceButton: UIButton!
    @IBOutlet weak var waterButton: UIButton!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

       // 네비게이션 속성
        navigationItem.title = "\(bossName)님의 다마고치"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "person.fill"), style: .plain, target: self, action: #selector(SettingButtonTapped))
        
        // 화면 디자인
        configure()
        dataConfig()
    }
    
    // MARK: - Actions
    
    @IBAction func enteredOnTextField(_ sender: UITextField) {
        
        var text = sender.text ?? ""
        text = text == "" ? "1" : text
        
        
        if let intText = Int(text) {
            
            if intText >= 100 {
                self.view.makeToast("다마고치는 99개까지 먹을 수 있어요ㅠ")
            } else {
                // 내용을 더하기
                switch sender {
                case riceTextField :
                    print(intText)
                    print("밥 욤욤")
                case waterTextField:
                    print(intText)
                    print("물 욤욤")
                default:
                    fatalError("잘못됨")
                }
            }
            
        } else {
            self.view.makeToast("숫자만 입력해주세요")
        }
    }
    

    

    @IBAction func feedButtonTapped(_ sender: UIButton) {
        
        switch sender {
        case riceButton :
            enteredOnTextField(riceTextField)
        case waterButton :
            enteredOnTextField(waterTextField)
        default :
            fatalError("잘못됨")
        }
        
        
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
    }

    
    
    @objc
    func SettingButtonTapped() {
        print("setting button tapped")
        
        // 세팅창 띄우기
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: SettingTableViewController.identifier) as! SettingTableViewController
        
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    // MARK: - Helpers
    
    // - 화면 요소 디자인
    func configure() {
        // 배경색
        self.view.backgroundColor = .DamagochiBackgroundColor
        // 라벨컬러
        dialogueLabel.textColor = .DamagochiFontAndBorderColor
        titleLabel.textColor = .DamagochiFontAndBorderColor
        statusLabel.textColor = .DamagochiFontAndBorderColor
        
        // 라벨 폰트
        titleLabel.font = .boldSystemFont(ofSize: 15)
        
        // 텍스트필드
        riceTextField.placeholder = "밥주세용"
        waterTextField.placeholder = "물주세용"
        
        riceTextField.textAlignment = .center
        waterTextField.textAlignment = .center
        
        riceTextField.addOnlyBottomBorder()
        waterTextField.addOnlyBottomBorder()
        
        riceTextField.keyboardType = .asciiCapableNumberPad
        waterTextField.keyboardType = .asciiCapableNumberPad
        
        riceTextField.clearsOnBeginEditing = true
        waterTextField.clearsOnBeginEditing = true
        
        
        // 버튼
        var config = UIButton.Configuration.plain()
        config.cornerStyle = .large
        config.titleAlignment = .center
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 5, leading: 4, bottom: 5, trailing: 4)
        config.imagePlacement = .leading
        config.background.strokeColor = .DamagochiFontAndBorderColor
        config.background.strokeWidth = 1.5
        

        riceButton.configuration = config
        waterButton.configuration = config
        
        riceButton.setTitle(" 밥주기", for: .normal)
        waterButton.setTitle(" 물주기", for: .normal)
        
        riceButton.setImage(UIImage(systemName: "leaf.circle"), for: .normal)
        waterButton.setImage(UIImage(systemName: "drop.circle"), for: .normal)
        
        riceButton.tintColor = .DamagochiFontAndBorderColor
        waterButton.tintColor = .DamagochiFontAndBorderColor
        
    }
    
    func dataConfig() {

        imageView.image = UIImage()
        titleLabel.text = String()
        statusLabel.text = "LV4 · 밥알 73개· 물방울 57개"

    }


}
