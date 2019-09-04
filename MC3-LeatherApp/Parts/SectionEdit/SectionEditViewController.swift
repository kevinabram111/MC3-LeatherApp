//
//  SectionEditViewController.swift
//  MC3-LeatherApp
//
//  Created by Michael Louis on 02/09/19.
//  Copyright © 2019 Kevin Abram. All rights reserved.
//

import UIKit

class SectionEditViewController: UIViewController {

    @IBOutlet weak var totalPercentageLabel: UILabel!
    @IBOutlet weak var leatherImageView: UIImageView!
    
    @IBOutlet weak var testImage: UIImageView!
    
    var sectionnumber = Int()
    var sectionbool = [Bool]()
    var total:Double = 0
    override func viewDidLoad() {
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        if(System.percentage.count == 0)
        {
            total = 0
        }
        else
        {
            for i in 0...System.percentage.count-1
            {
                total = total + System.percentage[i]
            }
            total = total / Double(System.percentage.count)
        }
        
        
        totalPercentageLabel.text = String(format: "Leather Quality: %.2f%%",total)
        
        super.viewDidLoad()
        if let leatherImage = System.leatherImage?.image
        {
            leatherImageView.image = leatherImage
        }
        
//        testImage.image = System.emptyImageSections[0].image
    }
    
    
    @IBAction func sectionTapped(_ sender: UIButton) {
       
        
        print("ini section \(sender.tag)")
        
        System.number = sender.tag
        if(System.savedDone[System.number!] == false)
        {
            performSegue(withIdentifier: "toCameraSection", sender: sender.tag)
            
        }
        else if(System.savedDone[System.number!] == true){
            performSegue(withIdentifier: "viewdetailsection", sender: sender.tag)
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        if let viewController = segue.destination as? SectionCamera
        {
            viewController.sectionNumberResult = System.number!
        }
    }
}

