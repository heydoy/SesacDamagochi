//
//  SettingTableViewController.swift
//  SesacDamagochi
//
//  Created by Doy Kim on 2022/07/25.
//

import UIKit

enum Setting: Int {
    case bossNameChange = 0
    case damagochiChange = 1
    case initialise = 2
    
}

class SettingTableViewController: UITableViewController {
    
    static let identifier = "SettingTableViewController"
    
    @IBOutlet weak var bossName: UILabel!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .damagochiBackgroundColor
        navigationItem.title = "설정"
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadRows(at: [IndexPath(row: Setting.bossNameChange.rawValue, section: 0)], with: .none)
        bossName.text = UserDefaultsManager.bossName
    }
    
    
    // MARK: - TableView Setting
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        switch indexPath.row {
        case Setting.bossNameChange.rawValue :
            // 대장이름 변경
            
            let vc = storyboard.instantiateViewController(withIdentifier: NameEditViewController.identifier) as! NameEditViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
        case Setting.damagochiChange.rawValue:
            // 다마고치 변경
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: SeclectCollectionViewController.identifier) as! SeclectCollectionViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        case Setting.initialise.rawValue :
            // 데이터 초기화
            
            initialiseAlert()
            
        default:
            print(":)")
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0
    }
    
    // MARK: - Actions
    
    func initialiseAlert() {
        let alert = UIAlertController(title: "데이터 초기화하시겠습니까?", message: "초기화하면 저장된 데이터가 모두 날아갑니다.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "네, 초기화합니다", style: .destructive, handler: { (action) in
            // 초기화코드
            cleanCompleteStorage()
            
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                    
            // 생명주기 관리하는 SceneDelegate 전체
            let sceneDelegate = windowScene?.delegate as? SceneDelegate
            
            // 처음 시작해서 보여줄 화면
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: ViewController.identifier) as! ViewController
            
            
            sceneDelegate?.window?.rootViewController = vc
            sceneDelegate?.window?.makeKeyAndVisible()
            
        })
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: true)
    }

}
