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
    
    @IBOutlet weak var yellowImage1: UIImageView!
    
    @IBOutlet weak var yellowImage2: UIImageView!
    
    @IBOutlet weak var yellowImage3: UIImageView!
    
    @IBOutlet weak var yellowImage4: UIImageView!
    
    @IBOutlet weak var yellowImage5: UIImageView!
    
    @IBOutlet weak var yellowImage6: UIImageView!
    
    @IBOutlet weak var yellowImage7: UIImageView!
    
    @IBOutlet weak var yellowImage8: UIImageView!
    
    @IBOutlet weak var status1Text: UILabel!
    
    @IBOutlet weak var status2Text: UILabel!
    
    @IBOutlet weak var status3Text: UILabel!
    
    @IBOutlet weak var status4Text: UILabel!
    
    @IBOutlet weak var status5Text: UILabel!
    
    @IBOutlet weak var status6Text: UILabel!
    
    @IBOutlet weak var status7Text: UILabel!
    
    @IBOutlet weak var status8Text: UILabel!
    
    @IBOutlet weak var defectStatus1Text: UILabel!
    
    @IBOutlet weak var defectStatus2Text: UILabel!
    
    @IBOutlet weak var defectStatus3Text: UILabel!
    
    @IBOutlet weak var defectStatus4Text: UILabel!
    
    @IBOutlet weak var defectStatus5Text: UILabel!
    
    @IBOutlet weak var defectStatus6Text: UILabel!
    
    @IBOutlet weak var defectStatus7Text: UILabel!
    
    @IBOutlet weak var defectStatus8Text: UILabel!
    
    
    
    
    //@IBOutlet weak var testImage: UIImageView!
    
    
    
    var sectionnumber = Int()
    var sectionbool = [Bool]()
    var total:Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3411764706, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
        
//        if(System.percentage.count == 0)
//        {
//            total = 0
//        }
//        else
//        {
//            for i in 0...System.percentage.count-1
//            {
//                total = total + System.percentage[i]
//            }
//            total = total / Double(System.percentage.count)
//        }
        
        var countPoints: Int = 0
        
        
        
        for countPoint in System.percentageSave
        {
            if countPoint == 0
            {
                
            }
            else
            {
                countPoints = countPoints + 1
            }
        }
        
        if(System.percentageSave.count == 0)
        {
            total = 0
        }
        else
        {
            for i in 0...System.percentageSave.count-1
            {
                total = total + System.percentageSave[i]
            }
            total = total / Double(countPoints)
        }
        
        if countPoints == 0
        {
            total = 0
        }
        
        if total == 0
        {
            totalPercentageLabel.isHidden = true
        }
        else
        {
            totalPercentageLabel.isHidden = false
            totalPercentageLabel.text = String(format: "Leather Quality: %.2f%%",total)
        }
        

        if let leatherImage = System.leatherImage?.image
        {
            leatherImageView.image = leatherImage
        }
        
//        testImage.image = System.emptyImageSections[0].image
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        makeRounded(cornerRadius: 10)
        
        if System.savedDone[1] == false
        {
            yellowImage1.alpha = 0
            status1Text.text = "Add Detail Photo"
            defectStatus1Text.alpha = 0
            
        }
        else
        {
            yellowImage1.alpha = 1
            status1Text.text = "See Detail"
            defectStatus1Text.alpha = 1
            defectStatus1Text.text = "Quality: " + String(format: "%.2f%%", (System.percentageSave[0]))
        }
        
        //
        
        if System.savedDone[2] == false
        {
            yellowImage2.alpha = 0
            status2Text.text = "Add Detail Photo"
            defectStatus2Text.alpha = 0
        }
        else
        {
            yellowImage2.alpha = 1
            status2Text.text = "See Detail"
            defectStatus2Text.alpha = 1
            defectStatus2Text.text = "Quality: " + String(format: "%.2f%%", (System.percentageSave[1]))
        }
        
        //
        
        if System.savedDone[3] == false
        {
            yellowImage3.alpha = 0
            status3Text.text = "Add Detail Photo"
            defectStatus3Text.alpha = 0
        }
        else
        {
            yellowImage3.alpha = 1
            status3Text.text = "See Detail"
            defectStatus3Text.alpha = 1
            defectStatus3Text.text = "Quality: " + String(format: "%.2f%%", (System.percentageSave[2]))
        }
        
        //
        
        if System.savedDone[4] == false
        {
            yellowImage4.alpha = 0
            status4Text.text = "Add Detail Photo"
            defectStatus4Text.alpha = 0
        }
        else
        {
            yellowImage4.alpha = 1
            status4Text.text = "See Detail"
            defectStatus4Text.alpha = 1
            defectStatus4Text.text = "Quality: " + String(format: "%.2f%%", (System.percentageSave[3]))
        }
        
        //
        
        if System.savedDone[5] == false
        {
            yellowImage5.alpha = 0
            status5Text.text = "Add Detail Photo"
            defectStatus5Text.alpha = 0
        }
        else
        {
            yellowImage5.alpha = 1
            status5Text.text = "See Detail"
            defectStatus5Text.alpha = 1
            defectStatus5Text.text = "Quality: " + String(format: "%.2f%%", (System.percentageSave[4]))
        }
        
        //
        
        if System.savedDone[6] == false
        {
            yellowImage6.alpha = 0
            status6Text.text = "Add Detail Photo"
            defectStatus6Text.alpha = 0
        }
        else
        {
            yellowImage6.alpha = 1
            status6Text.text = "See Detail"
            defectStatus6Text.alpha = 1
            defectStatus6Text.text = "Quality: " + String(format: "%.2f%%", (System.percentageSave[5]))
        }
        
        //
        
        if System.savedDone[7] == false
        {
            yellowImage7.alpha = 0
            status7Text.text = "Add Detail Photo"
            defectStatus7Text.alpha = 0
            
        }
        else
        {
            yellowImage7.alpha = 1
            status7Text.text = "See Detail"
            defectStatus7Text.alpha = 1
            defectStatus7Text.text = "Quality: " + String(format: "%.2f%%", (System.percentageSave[6]))
        }
        
        //
        
        if System.savedDone[8] == false
        {
            yellowImage8.alpha = 0
            status8Text.text = "Add Detail Photo"
            defectStatus8Text.alpha = 0
        }
        else
        {
            yellowImage8.alpha = 1
            status8Text.text = "See Detail"
            defectStatus8Text.alpha = 1
            defectStatus8Text.text = "Quality: " + String(format: "%.2f%%", (System.percentageSave[7]))
        }
        
        //
    }
    
    func makeRounded(cornerRadius: CGFloat)
    {
        yellowImage1.layer.cornerRadius = cornerRadius
        yellowImage2.layer.cornerRadius = cornerRadius
        yellowImage3.layer.cornerRadius = cornerRadius
        yellowImage4.layer.cornerRadius = cornerRadius
        yellowImage5.layer.cornerRadius = cornerRadius
        yellowImage6.layer.cornerRadius = cornerRadius
        yellowImage7.layer.cornerRadius = cornerRadius
        yellowImage8.layer.cornerRadius = cornerRadius
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

