//
//  OnboardingViewController.swift
//  Shop
//
//  Created by Кирилл Сысоев on 28.01.2025.
//

import UIKit

class OnboardingViewController: UIViewController {

    let titles = ["Начнем путешествие", "У вас есть сила, чтобы"]
    let texts = ["Умная, великолепная и модная коллекция\nИзучите сейчас", "В вашей комнате много красивых\nи привлекательных растений"]
    let images = ["Onboarding 2", "Onboarding 3"]
    
    var counter = 1
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    @objc func nextButtonTapped() {
        if counter == 2 {
            screensController.modalPresentationStyle = .fullScreen
            self.present(screensController, animated: true, completion: nil)
        } else {
            counter += 1
            setupUI()
        }
    }
    

    func setupUI() {
        pageControl.currentPage = counter
        image.image = UIImage(named: images[counter - 1])
        titleLabel.text = titles[counter - 1]
        label.text = texts[counter - 1]
    }
    

}
