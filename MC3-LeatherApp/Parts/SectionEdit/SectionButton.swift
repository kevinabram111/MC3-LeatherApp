//
//  SectionButton.swift
//  MC3-LeatherApp
//
//  Created by Kevin Abram on 02/09/19.
//  Copyright © 2019 Kevin Abram. All rights reserved.
//

import UIKit

class SectionButton: UIButton {
    
    override func awakeFromNib() {
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
        self.backgroundColor = .brown
   //     self.setTitle("Add Detail Photo", for: .normal)
        self.setTitle("", for: .normal)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
