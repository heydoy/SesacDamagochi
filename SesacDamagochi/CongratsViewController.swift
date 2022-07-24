//
//  CongratsViewController.swift
//  SesacDamagochi
//
//  Created by Doy Kim on 2022/07/25.
//

import UIKit
import Lottie

class CongratsViewController: UIViewController {
    
    // MARK: - Properties
    static let identifier = "CongratsViewController"

    @IBOutlet weak var popupView: UIView!
    @IBOutlet var returnButton: UIView!
    
    @IBOutlet weak var viewForLottie: AnimationView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        
        // animationView
        viewForLottie.frame = self.view.bounds
        viewForLottie.center = self.view.center
        viewForLottie.contentMode = .scaleAspectFill
        viewForLottie.loopMode = .loop
        viewForLottie.animationSpeed = 1.1
        viewForLottie.play { (finished) in
            print("애니메이션 끝")
        }
        
    }
    
    // MARK: - Actions
    
    @IBAction func returnButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
    // MARK: - Helpers
    
    func configure() {
        popupView.layer.cornerRadius = 12
        
        returnButton.backgroundColor = UIColor.DamagochiFontAndBorderColor
        returnButton.tintColor = .white
        returnButton.layer.cornerRadius = 12
        returnButton.clipsToBounds = true
    }



}
