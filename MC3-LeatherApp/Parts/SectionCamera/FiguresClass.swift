//
//  FiguresClass.swift
//  LeatherDefectApp
//
//  Created by Kevin Abram on 28/08/19.
//  Copyright © 2019 Andre Elandra. All rights reserved.
//

import Foundation
import UIKit

var FiguresArray = [Figures]()

var FigureBoxesArray = [FigureBox]()

var savedPicturesArray = [UIImage]()

class Figures
{
    var image: UIImage
    
    init(image: UIImage)
    {
        self.image = image
    }
}

class FigureBox
{
    var view: UIView
    var label: UILabel
    
    init(view: UIView, label: UILabel)
    {
        self.view = view
        self.label = label
    }
}

//class Pictures
//{
//    var image: UIImage
//    
//    init(image: UIImage)
//    {
//        self.image = image
//    }
//}

//class Done
//{
//    var done: Bool
//    
//    init(done: Bool) {
//        self.done = done
//    }
//}
