//
//  SectionCameraViewController.swift
//  MC3-LeatherApp
//
//  Created by Andre Elandra on 03/09/19.
//  Copyright © 2019 Kevin Abram. All rights reserved.
//

import UIKit
class SectionCameraViewController: UIViewController{
    
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBOutlet var screenshotView: UIView!
    var figureBoxesArrayAppend = [FigureBox]()
    //Aaaaaaaaaaaaaaaaaaaaaaaaaaaa
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        if let viewController = segue.destination as? SectionCamera
        {
            viewController.sectionNumberResult = System.number!
        }
    }
    
    
    
    //aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    @IBAction func confirmButtonTapped(_ sender: Any) {
        confirmButton.isHidden = true
        System.number = System.number
        System.savedPictures[System.number!] = screenshotView.asImage()
        
       // System.savedDone[System.number!] == true
        System.savedDone[System.number!] = true
        System.percentage.append(percentagelevel)
        System.percentageSave[(System.number!-1)] = percentagelevel
        
        
            
        performSegue(withIdentifier: "backtosection", sender: (Any).self)
        
        
        
    }
    
    @IBOutlet weak var percentageLabel: UILabel!
    
    @IBOutlet weak var sectionImg: UIImageView!
    
//    var i = 0
    var totalDefectArea: Double = 0
    var percentagelevel: Double = 0
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        sectionImg.image = FiguresArray.last?.image
        confirmButton.isHidden = false
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3411764706, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
        
        DispatchQueue.main.async {
            var addData = false
            for boxes in FigureBoxesArray
            {
                addData = true
                if self.figureBoxesArrayAppend.count == 0
                {
                    let newFigureBox = FigureBox(view: boxes.view, label: boxes.label)
                    self.figureBoxesArrayAppend.append(newFigureBox)
                }
                else
                {
                    for boxes2 in self.figureBoxesArrayAppend
                    {
                        if (boxes.view.frame.midX >= (boxes2.view.frame.midX - 30) && boxes.view.frame.midX <= (boxes2.view.frame.midX + 30)) && (boxes.view.frame.midY >= (boxes2.view.frame.midY - 30) && boxes.view.frame.midY <= (boxes2.view.frame.midY + 30))
                        {
                            addData = false
                            print("")
                            print("data gathered")
                            print("boxes: x:\(boxes.view.frame.midX) y: \(boxes.view.frame.midY)")
                            print("boxes2: x:\(boxes2.view.frame.midX) y: \(boxes2.view.frame.midY)")
                            print("")
                        }
                        else
                        {
                            print("")
                            print("data appended")
                            print("")
                        }
                    }
                }
                if addData == true
                {
                    let newFigureBox = FigureBox(view: boxes.view, label: boxes.label)
                    self.figureBoxesArrayAppend.append(newFigureBox)
                }
            }
            
            for boxes in self.figureBoxesArrayAppend
            {
                self.sectionImg.addSubview(boxes.view)
                self.sectionImg.addSubview(boxes.label)
                self.totalDefectArea += (Double(boxes.view.frame.width) * Double(boxes.view.frame.height))
            }
            
            let totalImageArea = (Double(self.sectionImg.frame.width) * Double(self.sectionImg.frame.height))
            self.percentageLabel.text = String(format: "%.2f%%", (
                (totalImageArea - self.totalDefectArea)
                    / totalImageArea * 100))
            self.percentagelevel =
                (totalImageArea - self.totalDefectArea)
                    / totalImageArea * 100
            print("")
            print("data found:")
            print("first count: \(FigureBoxesArray.count)")
            print("second count: \(self.figureBoxesArrayAppend.count)")
            print("")
            
        }
//        if (i%30 == 0){
        
//        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        confirmButton.isHidden = true
        navigationController?.navigationBar.barTintColor = UIColor.black
    }
    override func viewWillAppear(_ animated: Bool) {
    
//        sectionImg.addSubview()
        
//        sectionImg.image = FiguresArray[FiguresArray.endIndex-1].image
//        sectionImg.addSubview(FigureBoxesArray[FigureBoxesArray.endIndex-1].view)
//        print(FigureBoxesArray.count)
//        print(FiguresArray.count)
        
    }
    
}
