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

    @IBOutlet weak var viewForLottie: AnimationView!
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // animationView
        viewForLottie.frame = self.view.bounds
        viewForLottie.center = self.view.center
        viewForLottie.contentMode = .scaleAspectFit
        viewForLottie.loopMode = .repeatBackwards(1)
        viewForLottie.animationSpeed = 0.9
        
        viewForLottie.play { (finished) in
            print("애니메이션 끝")
            
            // 다마고치 선택했는지 여부 체크하기
            
            if self.userDefaults.bool(forKey: "isDamagochiSelected") == true {
                // 다마고치가 선택됐다면 메인 보여주기
                self.concierge(DamagochiMainViewController.identifier)
                
            } else {
                // 다마고치를 선택한 적 없다면 선택화면 보여주기
                self.concierge(SeclectCollectionViewController.identifier)
            }
        }
        
        
        
        
    }
    
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


}

