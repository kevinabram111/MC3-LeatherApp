//
//  SectionPreviewViewController.swift
//  MC3-LeatherApp
//
//  Created by Andre Elandra on 04/09/19.
//  Copyright © 2019 Kevin Abram. All rights reserved.
//

import UIKit

class SectionPreviewViewController: UIViewController {

    @IBOutlet weak var previewImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        previewImage.image = System.savedPictures[System.number!]
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
