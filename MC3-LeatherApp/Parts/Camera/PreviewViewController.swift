//
//  PreviewViewController.swift
//  leatherApp
//
//  Created by Kevin Abram on 12/08/19.
//  Copyright © 2019 Kevin Abram. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {
    
    @IBOutlet weak var photoView: UIImageView!
    
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoView.image = image
        // Do any additional setup after loading the view.
    }
    
//    @IBAction func cancelButton_TouchUpInside(_ sender: UIButton) {
//        dismiss(animated: true, completion: nil)
//    }
    
    // @IBAction func saveButton_TouchUpInside(_ sender: UIButton) {
    // }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let colorScanVC = segue.destination as! CameraViewController
//        colorScanVC.image = photoView.image!
        let leatherImage = LeatherImageObject(image: image, width: Double(photoView.frame.width), height: Double(photoView.frame.height))
        System.leatherImage = leatherImage
    }
    
    @IBAction func confirmButton_TouchUpInside(_ sender: UIButton) {
        
        let image = photoView.image!
        
        let imageWidth = photoView.contentClippingRect.width
        let imageHeight = photoView.contentClippingRect.height
        
        guard
        
        let section1Image = cropImage(image, toRect: CGRect(x: 0, y: 0, width: imageWidth/2, height: imageHeight/4), viewWidth: imageWidth, viewHeight: imageHeight),
        
        let section2Image = cropImage(image, toRect: CGRect(x: imageWidth/2, y: 0, width: imageWidth/2, height: imageHeight/4), viewWidth: imageWidth, viewHeight: imageHeight),
        
        let section3Image = cropImage(image, toRect: CGRect(x: 0, y: imageHeight*1/4, width: imageWidth/2, height: imageHeight/4), viewWidth: imageWidth, viewHeight: imageHeight),
        
        let section4Image = cropImage(image, toRect: CGRect(x: imageWidth/2, y: imageHeight*1/4, width: imageWidth/2, height: imageHeight/4), viewWidth: imageWidth, viewHeight: imageHeight),
        
        let section5Image = cropImage(image, toRect: CGRect(x: 0, y: imageHeight*2/4, width: imageWidth/2, height: imageHeight/4), viewWidth: imageWidth, viewHeight: imageHeight),
        
        let section6Image = cropImage(image, toRect: CGRect(x: imageWidth/2, y: imageHeight*2/4, width: imageWidth/2, height: imageHeight/4), viewWidth: imageWidth, viewHeight: imageHeight)
        
//        let section7Image = cropImage(image, toRect: CGRect(x: 0, y: imageHeight*3/4, width: imageWidth/2, height: imageHeight/4), viewWidth: imageWidth, viewHeight: imageHeight),
//
//        let section8Image = cropImage(image, toRect: CGRect(x: imageWidth/2, y: imageHeight*3/4, width: imageWidth/2, height: imageHeight/4), viewWidth: imageWidth, viewHeight: imageHeight)
            else {
                return
        }
        
        let section1 = EmptyImageSectionObject(section: 1, image: section1Image, width: Double(imageWidth), height: Double(imageHeight))
        
        let section2 = EmptyImageSectionObject(section: 2, image: section2Image, width: Double(imageWidth), height: Double(imageHeight))
        
        let section3 = EmptyImageSectionObject(section: 3, image: section3Image, width: Double(imageWidth), height: Double(imageHeight))
        
        let section4 = EmptyImageSectionObject(section: 4, image: section4Image, width: Double(imageWidth), height: Double(imageHeight))
        
        let section5 = EmptyImageSectionObject(section: 5, image: section5Image, width: Double(imageWidth), height: Double(imageHeight))
        
        let section6 = EmptyImageSectionObject(section: 6, image: section6Image, width: Double(imageWidth), height: Double(imageHeight))
        
//        let section7 = EmptyImageSectionObject(section: 7, image: section7Image, width: Double(imageWidth), height: Double(imageHeight))
//
//        let section8 = EmptyImageSectionObject(section: 8, image: section8Image, width: Double(imageWidth), height: Double(imageHeight))
        
        System.emptyImageSections.append(section1)
        System.emptyImageSections.append(section2)
        System.emptyImageSections.append(section3)
        System.emptyImageSections.append(section4)
        System.emptyImageSections.append(section5)
        System.emptyImageSections.append(section6)
//        System.emptyImageSections.append(section7)
//        System.emptyImageSections.append(section8)
        
        performSegue(withIdentifier: "segueEdit", sender: nil)
    }
    
    func cropImage(
        _ inputImage: UIImage,
        toRect cropRect: CGRect,
        viewWidth: CGFloat,
        viewHeight: CGFloat) -> UIImage?
    {
        let imageViewScale = max(inputImage.size.width / viewWidth,
                                 inputImage.size.height / viewHeight)
        
        print(inputImage.size.width)
        print(inputImage.size.height)
        print(imageViewScale)

        // Scale cropRect to handle images larger than shown-on-screen size
        let cropZone = CGRect(x:cropRect.origin.x * imageViewScale,
                              y:cropRect.origin.y * imageViewScale,
                              width:cropRect.size.width * imageViewScale,
                              height:cropRect.size.height * imageViewScale)
        
        // Perform cropping in Core Graphics
        guard let cutImageRef: CGImage = inputImage.cgImage?.cropping(to:cropZone)
            else {
                return nil
        }

        // Return image to UIImage
        let croppedImage: UIImage = UIImage(cgImage: cutImageRef)
        return croppedImage
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}

extension UIImageView {
    var contentClippingRect: CGRect {
        guard let image = image else { return bounds }
        guard contentMode == .scaleAspectFit else { return bounds }
        guard image.size.width > 0 && image.size.height > 0 else { return bounds }
        
        let scale: CGFloat
        if image.size.width > image.size.height {
            scale = bounds.width / image.size.width
        } else {
            scale = bounds.height / image.size.height
        }
        
        let size = CGSize(width: image.size.width * scale, height: image.size.height * scale)
        let x = (bounds.width - size.width) / 2.0
        let y = (bounds.height - size.height) / 2.0
        
        return CGRect(x: x, y: y, width: size.width, height: size.height)
    }
}

