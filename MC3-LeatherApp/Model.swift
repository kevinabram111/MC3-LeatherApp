//
//  Objects.swift
//  MC3-LeatherApp
//
//  Created by Kevin Abram on 01/09/19.
//  Copyright © 2019 Kevin Abram. All rights reserved.
//

import Foundation
import UIKit

//Edit these based on your needs

//
// 1. Static Variables (Arrays and Temporary Storage) and Functions
//

struct System
{
    static var number: Int?
    
    static var appendController: Bool?
    
    //To store the leatherImage.
    static var leatherImage: LeatherImageObject?
    
    //To store the emptyImageSections for helping the users in taking parts of the leathers.
    static var emptyImageSections = [EmptyImageSectionObject]()
    
    //To store the imageSections after taking photos
    static var imageSections = [ImageSectionObject]()
    
    //A function to calculate the percentage defect
    static func calculatePercentageDefect() -> Double
    {
        var defectIncrement: Double = 0
            for section in imageSections
            {
                defectIncrement += section.percentageDefect
            }
        return defectIncrement
    }
    
    static var savedPictures = [UIImage]()
    static var savedDone = [Bool]()
    static var percentage = [Double]()
    static var percentageSave: [Double] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]

}

//
// 2. Classes
//

//To be used when uploading a single image.
//Note: There should be only one image that is stored, stored as a UIImage as temporary data in System.leatherImage.
class LeatherImageObject
{
    var image: UIImage
    var width: Double
    var height: Double
    init(image: UIImage, width: Double, height: Double)
    {
        self.image = image
        self.width = width
        self.height = height
    }
}

//These are the image sections when the image is split into several sections.
//Note: A single image can be split up into several sections.
class EmptyImageSectionObject
{
    var section: Int
    var image: UIImage
    var width: Double
    var height: Double
    init(section: Int, image: UIImage, width: Double, height: Double)
    {
        self.section = section
        self.image = image
        self.width = width
        self.height = height
    }
}

//These are the image sections that are captured by camera by the user
//Note: Use this when the user captured a new photo.
class ImageSectionObject
{
    var section: Int
    var image: UIImage
    var width: Double
    var height: Double
    var defectCoordinates: [DefectCoordinateObject]
    var percentageDefect: Double
    init(section: Int, image: UIImage, width: Double, height: Double, defectCoordinates: [DefectCoordinateObject], percentageDefect: Double)
    {
        self.section = section
        self.image = image
        self.width = width
        self.height = height
        self.defectCoordinates = defectCoordinates
        self.percentageDefect = percentageDefect
    }
}

//These are the defects objects inside the image sections.
//Note: Xcoordinate and Ycoordinate, along with width and height are different when implemented in views of different frame width and height.
class DefectCoordinateObject
{
    var Xcoordinate: Double
    var Ycoordinate: Double
    var width: Double
    var height: Double
    init(Xcoordinate: Double, Ycoordinate: Double, width: Double, height: Double)
    {
        self.Xcoordinate = Xcoordinate
        self.Ycoordinate = Ycoordinate
        self.width = width
        self.height = height
    }
}


