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
    
    var bossName: String?

    @IBOutlet weak var userTextField: UITextField!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 설정
        navigationItem.title = "대장님 이름 정하기"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonTapped))
        
        // 디자인
        configure()

    }
    
    
    // MARK: - Actions
    
    @objc
    func saveButtonTapped() {
        // 유효성 체크, 저장하고 사라지기
        
        if let name = bossName, name != "", (2...6).contains(name.count) {
            //저장
        } else {
            self.view.makeToast("이름을 다시 입력해주세요. 2~6글자여야 합니다.")
        }
        
        self.dismiss(animated: true)
        
    }
    
    @IBAction func userTextFieldEditingChanged(_ sender: UITextField) {
        
        bossName = sender.text
    }
    

    // MARK: - Helpers
    
    func configure() {
        view.backgroundColor = .DamagochiBackgroundColor
        
        userTextField.addOnlyBottomBorder()
        userTextField.placeholder = "대장님의 바꿀 이름을 입력해주세요"
        userTextField.text = "기존 대장님 이름 가져오기"
        userTextField.textColor = .DamagochiFontAndBorderColor
        
        
    }

}
