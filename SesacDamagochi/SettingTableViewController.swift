//
//  SettingTableViewController.swift
//  SesacDamagochi
//
//  Created by Doy Kim on 2022/07/25.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    static let identifier = "SettingTableViewController"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .DamagochiBackgroundColor
        navigationItem.title = "설정"
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0 :
            // 대장이름 변경
            print("대장")
        case 1:
            // 다마고치 변경
            print("다마고치 변경, 내용저장")
        case 2:
            // 데이터 초기화
            print("데이터초기화")
            
        default:
            fatalError("잘못됨")
        }
    }

}
