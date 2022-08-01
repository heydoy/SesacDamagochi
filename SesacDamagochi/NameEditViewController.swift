//
//  NameEditViewController.swift
//  SesacDamagochi
//
//  Created by Doy Kim on 2022/07/25.
//

import UIKit

class NameEditViewController: UIViewController {
    // MARK: - Properties
    static let identifier = "NameEditViewController"
    
    let bossName = UserDefaultsManager.bossName
    var newBossName: String?

    @IBOutlet weak var userTextField: UITextField!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 설정
        navigationItem.title = bossName
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonTapped))
        
        // 디자인
        configure()

    }
    
    
    // MARK: - Actions
    
    @objc
    func saveButtonTapped() {
        // 유효성 체크, 저장하고 사라지기
        
        if let name = newBossName, !name.isEmpty , (2...6).contains(name.count) {
            //묻기
            let alert = UIAlertController(title: "보스 이름 변경", message: "보스 이름을 \(bossName)에서 \(name)으로 바꾸시겠습니까?", preferredStyle: .alert)
            let ok = UIAlertAction(title: "네, 바꿉니다", style: .default) { (action) in
                UserDefaultsManager.bossName = name
                self.navigationController?.popViewController(animated: true)
                
            }
            let cancel = UIAlertAction(title: "아뇨", style: .cancel, handler: nil)
            
            alert.addAction(ok)
            alert.addAction(cancel)
            
            self.present(alert, animated: true)
            
            //저장
            
        } else {
            self.view.makeToast("이름을 다시 입력해주세요. 2~6글자여야 합니다.")
        }
        
        
        
    }
    
    @IBAction func userTextFieldEditingChanged(_ sender: UITextField) {
        
        newBossName = sender.text
    }
    

    // MARK: - Helpers
    
    func configure() {
        view.backgroundColor = .damagochiBackgroundColor
        
        userTextField.addOnlyBottomBorder()
        userTextField.placeholder = "대장님의 바꿀 이름을 입력해주세요"
        userTextField.font = .customFont(size: 12)
        userTextField.text = bossName
        userTextField.textColor = .damagochiFontAndBorderColor
        
        
    }

}
