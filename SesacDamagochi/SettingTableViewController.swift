//
//  SettingTableViewController.swift
//  SesacDamagochi
//
//  Created by Doy Kim on 2022/07/25.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    static let identifier = "SettingTableViewController"
    
    @IBOutlet weak var bossName: UILabel!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .DamagochiBackgroundColor
        navigationItem.title = "설정"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        bossName.text = UserDefaultsManager.bossName
    }
    
    
    // MARK: - TableView Setting
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0 :
            // 대장이름 변경
            print("대장이름 변경")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: NameEditViewController.identifier) as! NameEditViewController
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            // 다마고치 변경
            print("다마고치 변경, 내용저장")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: SeclectCollectionViewController.identifier) as! SeclectCollectionViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 2:
            // 데이터 초기화
            print("데이터초기화")
            let alert = UIAlertController(title: "데이터 초기화하시겠습니까?", message: "초기화하면 저장된 데이터가 모두 날아갑니다.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "네, 초기화합니다", style: .destructive, handler: { (action) in
                // 초기화코드
                cleanCompleteStorage()
                
                let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                        
                // 생명주기 관리하는 SceneDelegate 전체
                let sceneDelegate = windowScene?.delegate as? SceneDelegate
                
                // 처음 시작해서 보여줄 화면
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: ViewController.identifier) as! ViewController
                
                
                sceneDelegate?.window?.rootViewController = vc
                sceneDelegate?.window?.makeKeyAndVisible()
                
                
                
            })
            let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            
            alert.addAction(ok)
            alert.addAction(cancel)
            
            self.present(alert, animated: true)
            
        default:
            fatalError("잘못됨")
        }
    }

}
