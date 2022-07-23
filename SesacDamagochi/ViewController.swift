//
//  ViewController.swift
//  SesacDamagochi
//
//  Created by Doy Kim on 2022/07/22.
//

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

