//
//  SectionEditViewController.swift
//  MC3-LeatherApp
//
//  Created by Michael Louis on 02/09/19.
//  Copyright © 2019 Kevin Abram. All rights reserved.
//

import UIKit

class SectionEditViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func button1Tapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "SectionCamera", bundle: nil)
        
        guard let vc = storyboard.instantiateInitialViewController() else { return }
        
        present(vc, animated: true, completion: nil)
    }
    @IBAction func button2Tapped(_ sender: Any) {
        
         var sectionnumber = 2
        
        let storyboard = UIStoryboard(name: "SectionCamera", bundle: nil)
        
        guard let vc = storyboard.instantiateInitialViewController() else { return }
        
        present(vc, animated: true, completion: nil)
    }
    @IBAction func button3Tapped(_ sender: Any) {
        
         var sectionnumber = 3
        
        let storyboard = UIStoryboard(name: "SectionCamera", bundle: nil)
        
        guard let vc = storyboard.instantiateInitialViewController() else { return }
        
        present(vc, animated: true, completion: nil)
        
    }
    @IBAction func button4Tapped(_ sender: Any) {
        
         var sectionnumber = 4
        
        let storyboard = UIStoryboard(name: "SectionCamera", bundle: nil)
        
        guard let vc = storyboard.instantiateInitialViewController() else { return }
        
        present(vc, animated: true, completion: nil)
        
    }
    @IBAction func button5Tapped(_ sender: Any) {
        
        var sectionnumber = 5
        
        let storyboard = UIStoryboard(name: "SectionCamera", bundle: nil)
        
        guard let vc = storyboard.instantiateInitialViewController() else { return }
        
        present(vc, animated: true, completion: nil)
        
    }
    @IBAction func button6Tapped(_ sender: Any) {
        
         var sectionnumber = 6
        
        let storyboard = UIStoryboard(name: "SectionCamera", bundle: nil)
        
        guard let vc = storyboard.instantiateInitialViewController() else { return }
        
        present(vc, animated: true, completion: nil)
        
    }
    @IBAction func button7Tapped(_ sender: Any) {
        
         var sectionnumber = 7
        
        let storyboard = UIStoryboard(name: "SectionCamera", bundle: nil)
        
        guard let vc = storyboard.instantiateInitialViewController() else { return }
        
        present(vc, animated: true, completion: nil)
        
    }
    @IBAction func button8Tapped(_ sender: Any) {
        
         var sectionnumber = 8
        
        let storyboard = UIStoryboard(name: "SectionCamera", bundle: nil)
        
        guard let vc = storyboard.instantiateInitialViewController() else { return }
        
        present(vc, animated: true, completion: nil)
        
    }
}
