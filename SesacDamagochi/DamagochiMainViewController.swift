//
//  DamagochiMainViewController.swift
//  SesacDamagochi
//
//  Created by Doy Kim on 2022/07/24.
//

import UIKit
import Toast
import Alamofire

class DamagochiMainViewController: UIViewController {
    // MARK: - Properties
    static let identifier = "DamagochiMainViewController"
    var dialogues: [Dialogue]?
    
    let selected = UserDefaultsManager.SelectedDamagochiId - 1
    
    // - Outlet Variable
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

        self.fetchResult ( completionHandler: {[weak self] result in
            guard let self = self else { return } // 일시적으로 self가 strong reference로 만들게 하는 작업
               switch result {
               case let .success(result) :
                   debugPrint("success \(result)")
                   self.dialogues = result
                   
               case let .failure(error) :
                   debugPrint("error \(error)")
           }
        })
        
       // 네비게이션 속성
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle.fill"), style: .plain, target: self, action: #selector(SettingButtonTapped))
        navigationItem.backButtonTitle = .none
        self.navigationController?.navigationBar.backgroundColor = .damagochiBackgroundColor
        
        // 화면 디자인

        configure()
        dataConfig()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = "\(UserDefaultsManager.bossName)의 다마고치"
        view.layoutIfNeeded()
    }
    
    // MARK: - Actions
    
    @IBAction func enteredOnTextField(_ sender: UITextField) {
        
        guard let text = sender.text else { return }
        
        let stringText = text.isEmpty ? "1" : text
        
        if let intText = Int(stringText) {
            
            if intText >= 100 {
                self.view.makeToast("다마고치는 99개까지 먹을 수 있어요ㅠ")
            } else {
                // 내용을 더하기
                switch sender {
                case riceTextField :
                    UserDefaultsManager.damagochiList[selected].rice += intText
                    dataConfig()
                case waterTextField:
                    UserDefaultsManager.damagochiList[selected].water += intText
                    dataConfig()
                default:
                    assert(false)
                }
                
                if UserDefaultsManager.damagochiList[selected].level == 10 && UserDefaultsManager.damagochiList[selected].achieved == false {
                    // 축하 팝업 한번만 띄우기 
                    UserDefaultsManager.damagochiList[selected].achieved = true
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: CongratsViewController.identifier) as! CongratsViewController
                    
                    vc.modalPresentationStyle = .overCurrentContext
                    vc.modalTransitionStyle = .crossDissolve
                    
                    self.present(vc, animated: true)
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
            assert(false)
        }
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
        self.view.backgroundColor = .damagochiBackgroundColor
        // 라벨컬러
        dialogueLabel.textColor = .damagochiFontAndBorderColor
        titleLabel.textColor = .damagochiFontAndBorderColor
        statusLabel.textColor = .damagochiFontAndBorderColor
        
        // 라벨 폰트
        dialogueLabel.font = .customFont(size: 11)
        titleLabel.font = .customFont(size: 13, family: .medium)
        titleLabel.layer.borderWidth = 2
        titleLabel.layer.borderColor = UIColor.damagochiFontAndBorderColor.cgColor
        titleLabel.layer.cornerRadius = 8
        
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
        config.background.strokeColor = .damagochiFontAndBorderColor
        config.background.strokeWidth = 1.5
        

        riceButton.configuration = config
        waterButton.configuration = config
        
        riceButton.setTitle(" 밥주기", for: .normal)
        waterButton.setTitle(" 물주기", for: .normal)
        
        riceButton.setImage(UIImage(systemName: "leaf.circle"), for: .normal)
        waterButton.setImage(UIImage(systemName: "drop.circle"), for: .normal)
        
        riceButton.tintColor = .damagochiFontAndBorderColor
        waterButton.tintColor = .damagochiFontAndBorderColor
        
    }

    
    
    // 다마고치 상태, 말풍선
    func dataConfig() {
        
        let damagochi = UserDefaultsManager.damagochiList


        imageView.image = UIImage(named: damagochi[selected].image)
        
        
        titleLabel.text = damagochi[selected].name
        statusLabel.text = "LV \(damagochi[selected].level) · 밥알 \(damagochi[selected].rice)개 · 물방울 \(damagochi[selected].water)개"
        
        dialogueLabel.text = "\(UserDefaultsManager.bossName)! 오늘의 명언이에요"
        // 글자를 느리게 가져오는 문제
        if let line = dialogues?.randomElement() {
            dialogueLabel.text = "\(UserDefaultsManager.bossName)! 오늘의 명언이에요\n\n \(line.en) \n- \(line.author)"
            
        }
        
    }
    
    
    // 다마고치 말풍선: 명언 가져오기
    func fetchResult( completionHandler: @escaping (Result<[Dialogue], Error>)-> Void ) {
        let url = "https://programming-quotes-api.herokuapp.com/quotes"

        AF.request(url, method: .get)
        
        .responseData(completionHandler: { response in
            switch response.result {
            case let .success(data) :
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode([Dialogue].self, from: data)
                    completionHandler(.success(result))
                    
                } catch {
                    completionHandler(.failure(error))
                }
            case let .failure(error) :
                completionHandler(.failure(error))
            }

        })
    }

}
