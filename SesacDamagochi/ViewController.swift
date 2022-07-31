//
//  ViewController.swift
//  SesacDamagochi
//
//  Created by Doy Kim on 2022/07/22.
//

/*
 
 Lottie를 이용한 Launch Screen
 참고링크 : https://lottiefiles.com/blog/working-with-lottie/how-to-add-lottie-animation-ios-app-swift
 
 */



import UIKit
import Lottie


class ViewController: UIViewController {
    
    // MARK: - Properties
    
    static let identifier = "LaunchScreen"

    @IBOutlet weak var viewForLottie: AnimationView!
    
    // Notification
    let notificationCenter = UNUserNotificationCenter.current()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Notification 요청
        requestAuthorization()
        
        // animationView
        viewForLottie.frame = self.view.bounds
        viewForLottie.center = self.view.center
        viewForLottie.contentMode = .scaleAspectFit
        viewForLottie.loopMode = .repeat(1)
        viewForLottie.animationSpeed = 1.0
        
        viewForLottie.play { (finished) in
            print("애니메이션 끝")
            
            // 다마고치 선택했는지 여부 체크하기
            
            switch UserDefaultsManager.status {
            case .start :
                // 다마고치를 선택한 적 없다면 선택화면 보여주기
                self.concierge(SeclectCollectionViewController.identifier)
            case .edit :
                // 다마고치가 선택됐다면 메인 보여주기
                self.concierge(DamagochiMainViewController.identifier)
            }
            

        }
        
        
        
        
    }
    
    // MARK: - Helpers
    // - Design
    func concierge(_ identifier: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        switch identifier {
        case SeclectCollectionViewController.identifier :
            let vc = storyboard.instantiateViewController(withIdentifier: identifier) as! SeclectCollectionViewController
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            nav.modalTransitionStyle = .crossDissolve
            self.present(nav, animated: true)
            
            
        case DamagochiMainViewController.identifier :
            let vc = storyboard.instantiateViewController(withIdentifier: identifier) as! DamagochiMainViewController
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            nav.modalTransitionStyle = .crossDissolve
            self.present(nav, animated: true)
            
            
        default:
            fatalError("identifier's wrong")
        }
        
    }
    
    // - Notification
    func requestAuthorization () {
        
        let authorizationOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)
        
        notificationCenter.requestAuthorization(options: authorizationOptions) { success, error in
            if success {
                self.sendNotification()
            }
        }
    }
    
    func sendNotification() {
        
        // 콘텐트
        let notificationContent = UNMutableNotificationContent() // mutable 없으면 get-only임
        
        notificationContent.title = "🐱안뇽하세요 주인님"
        notificationContent.body = "저 배고파요. 키워주새오 "
        notificationContent.subtitle = "오늘 행운의 숫자는 \(Int.random(in: 1...45))"
        
        notificationContent.badge = 1
        
        // 1시간에 한 번씩
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3600, repeats: true)
        
        // 트리거 - 캘린더

        let request = UNNotificationRequest(identifier: "\(Date())", content: notificationContent, trigger: trigger)
        
        
        // 알림센터에 추가
        notificationCenter.add(request)

    }
    


}

