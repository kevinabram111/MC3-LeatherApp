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
    
    @IBAction func cancelButton_TouchUpInside(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // @IBAction func saveButton_TouchUpInside(_ sender: UIButton) {
    // }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let colorScanVC = segue.destination as! CameraViewController
//        colorScanVC.image = photoView.image!
        let leatherImage = LeatherImageObject(image: image, width: Double(photoView.frame.width), height: Double(photoView.frame.height))
        System.leatherImage = leatherImage
    }
    
    @IBAction func confirmButton_TouchUpInside(_ sender: UIButton) {
        
        generateSections(image: image)
        
        performSegue(withIdentifier: "segueEdit", sender: nil)
    }
    
    func generateSections(image: UIImage)
    {
//        let section1 = EmptyImageSectionObject(section: 1, image: cropImage(image: image, rect: CGRect(x: 10, y: 0, width: 207, height: 172)), width: 414, height: 688)
        
        let section1 = EmptyImageSectionObject(section: 1, image: cropImage(photoView.image!, toRect: CGRect(x: 0, y: 0, width: 207, height: 172), viewWidth: 414, viewHeight: 688)!, width: Double(photoView.frame.width), height: Double(photoView.frame.width))
        
       // photoView.image.crop
        
        System.emptyImageSections.append(section1)
        
        print("counted sections: \(System.emptyImageSections.count)")
    }
    
    func cropImage(image: UIImage, rect: CGRect) -> UIImage {
        let cgImage = image.cgImage! // better to write "guard" in realm app
        let croppedCGImage = cgImage.cropping(to: rect)
        return UIImage(cgImage: croppedCGImage!)
    }
    
    func cropImage(_ inputImage: UIImage, toRect cropRect: CGRect, viewWidth: CGFloat, viewHeight: CGFloat) -> UIImage?
    {
        let imageViewScale = max(inputImage.size.width / viewWidth,
                                 inputImage.size.height / viewHeight)

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
