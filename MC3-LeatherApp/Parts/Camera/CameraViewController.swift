//
//  CameraViewController.swift
//  MC3-LeatherApp
//
//  Created by Michael Louis on 02/09/19.
//  Copyright © 2019 Kevin Abram. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class CameraViewController: UIViewController {
    

    
    @IBOutlet weak var cameraButton: UIButton!
    
    var captureSession = AVCaptureSession()
    var backCamera: AVCaptureDevice?
    var frontCamera: AVCaptureDevice?
    var currentCamera: AVCaptureDevice?
    
    var photoOutput: AVCapturePhotoOutput?
    
    var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
    var image : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCaptureSession()
        setupDevice()
        setupInputOutput()
        setupPreviewLayer()
        startRunningCaptureSession()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let previewVC = segue.destination as! PreviewViewController
        previewVC.image = image!
    }
    @IBAction func camera_TouchUpInside(_ sender: UIButton) {
        let settings = AVCapturePhotoSettings()
        
        //            switch settings.flashMode
        //            {
        //            case .off:
        //                print("off")
        //            case .on :
        //                print("on")
        //            case .auto:
        //                print("auto")
        //            @unknown default:
        //                break
        //        }
        
        //  settings.flashMode = .on
        
        photoOutput?.capturePhoto(with: settings, delegate: self as! AVCapturePhotoCaptureDelegate)
        
        //        performSegue(withIdentifier: "showPhoto_Segue", sender: nil)
    }
    func startRunningCaptureSession()
    {
        captureSession.startRunning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        cameraButton.layer.cornerRadius = cameraButton.frame.width/2
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func setupCaptureSession()
    {
        captureSession.sessionPreset = .photo
    }
    
    func setupDevice()
    {
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .unspecified)
        
        let devices = deviceDiscoverySession.devices
        
        for device in devices
        {
            if device.position == .back
            {
                backCamera = device
            }
            else if device.position == .front
            {
                frontCamera = device
            }
        }
        
        currentCamera = backCamera
    }
    
    func setupInputOutput()
    {
        do
        {
            let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera!)
            captureSession.addInput(captureDeviceInput)
            photoOutput = AVCapturePhotoOutput()
            photoOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])], completionHandler: nil)
            captureSession.addOutput(photoOutput!)
        }
        catch
        {
            print(error)
        }
    }
    
    func setupPreviewLayer()
    {
        cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        cameraPreviewLayer?.videoGravity = .resizeAspectFill
        cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        cameraPreviewLayer?.frame = self.view.frame
        self.view.layer.insertSublayer(cameraPreviewLayer!, at: 0)
    }
    
}

extension CameraViewController: AVCapturePhotoCaptureDelegate
{
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let imageData = photo.fileDataRepresentation()
        {
            
            image = UIImage(data: imageData)
            performSegue(withIdentifier: "showPhoto_Segue", sender: nil)
        }
    }
}

