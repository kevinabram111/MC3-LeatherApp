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
        let colorScanVC = segue.destination as! CameraViewController
        colorScanVC.image = photoView.image!
    }
    
    @IBAction func SubmitPhotoButton_TouchUpInside(_ sender: UIButton) {
        performSegue(withIdentifier: "colorScan_Segue", sender: nil)
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
