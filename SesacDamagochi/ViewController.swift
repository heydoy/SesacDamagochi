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
        }
    }


}

