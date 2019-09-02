//
//  SectionCamera.swift
//  MC3-LeatherApp
//
//  Created by Kevin Abram on 02/09/19.
//  Copyright © 2019 Kevin Abram. All rights reserved.
//

import UIKit
import Vision
import CoreMedia

class SectionCamera: UIViewController {
    
    @IBOutlet weak var videoPreview: UIView!
    
    @IBOutlet weak var boxesView: DrawingBoundingBoxView!
    
    @IBOutlet weak var cameraButton: UIButton!
    
    let objectDetectionModel = YOLOv3Tiny()
    
    // MARK: - Vision Properties
    var request: VNCoreMLRequest?
    var visionModel: VNCoreMLModel?
    var isInferencing = false
    
    // MARK: - AV Property
    var videoCapture: VideoCapture!
    let semaphore = DispatchSemaphore(value: 1)
    var lastExecution = Date()
    
    // MARK: - TableView Data
    var predictions: [VNRecognizedObjectObservation] = []
    
    // MARK - Performance Measurement Property
    private let performanceMeasurement = 📏()
    
    //MARK: - Timer
    var timerSeconds = 6
    var timer = Timer()
    
    
    //    let maf1 = MovingAverageFilter()
    //    let maf2 = MovingAverageFilter()
    //    let maf3 = MovingAverageFilter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        cameraButton.layer.cornerRadius = cameraButton.frame.width/2
        
        // setup the model
        setUpModel()
        
        // setup camera
        setUpCamera()
        
        
        
        // setup delegate for performance measurement
        //        performanceMeasurement.delegate = self
        
    }
    
    func runTimer()
    {
        timerSeconds = 5
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer()
    {
        timerSeconds -= 1 //This will decrement(count down)the seconds.
        print("Current Timer: \(timerSeconds)")
        if timerSeconds == 0
        {
            timer.invalidate()
            performSegue(withIdentifier: "showFigures", sender: nil)
        }
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    //    override var preferredStatusBarStyle: UIStatusBarStyle {
    //        return .lightContent
    //    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        timerSeconds = 6
        cameraButton.isEnabled = true
        // self.videoCapture.start()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.videoCapture.stop()
    }
    
    // MARK: - Setup Core ML
    func setUpModel() {
        if let visionModel = try? VNCoreMLModel(for: LeatherDefectObjectDetection().model) {
            self.visionModel = visionModel
            request = VNCoreMLRequest(model: visionModel, completionHandler: visionRequestDidComplete)
            request?.imageCropAndScaleOption = .scaleFill
        } else {
            fatalError("fail to create vision model")
        }
    }
    
    // MARK: - SetUp Video
    func setUpCamera() {
        videoCapture = VideoCapture()
        videoCapture.delegate = self
        videoCapture.fps = 30
        videoCapture.setUp(sessionPreset: .high) { success in
            
            if success {
                // add preview view on the layer
                if let previewLayer = self.videoCapture.previewLayer {
                    self.videoPreview.layer.addSublayer(previewLayer)
                    self.resizePreviewLayer()
                }
                
                // start video preview when setup is done
                self.videoCapture.start()
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        resizePreviewLayer()
    }
    
    func resizePreviewLayer() {
        videoCapture.previewLayer?.frame = videoPreview.bounds
    }
    
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        self.videoCapture.start()
        runTimer()
        self.cameraButton.isEnabled = false
    }
    
}

// MARK: - VideoCaptureDelegate
extension SectionCamera: VideoCaptureDelegate {
    func videoCapture(_ capture: VideoCapture, didCaptureVideoFrame pixelBuffer: CVPixelBuffer?, timestamp: CMTime) {
        // the captured image from camera is contained on pixelBuffer
        if !self.isInferencing, let pixelBuffer = pixelBuffer {
            self.isInferencing = true
            
            // start of measure
            self.performanceMeasurement.🎬👏()
            
            // predict!
            self.predictUsingVision(pixelBuffer: pixelBuffer)
        }
    }
}

extension SectionCamera {
    func predictUsingVision(pixelBuffer: CVPixelBuffer) {
        guard let request = request else { fatalError() }
        // vision framework configures the input size of image following our model's input configuration automatically
        self.semaphore.wait()
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer)
        try? handler.perform([request])
    }
    
    // MARK: - Post-processing
    func visionRequestDidComplete(request: VNRequest, error: Error?) {
        self.performanceMeasurement.🏷(with: "endInference")
        if let predictions = request.results as? [VNRecognizedObjectObservation] {
            //            print(predictions.first?.labels.first?.identifier ?? "nil")
            //            print(predictions.first?.labels.first?.confidence ?? -1)
            
            self.predictions = predictions
            DispatchQueue.main.async {
                self.boxesView.predictedObjects = predictions
                //                self.labelsTableView.reloadData()
                
                // end of measure
                self.performanceMeasurement.🎬🤚()
                
                self.isInferencing = false
            }
        } else {
            // end of measure
            self.performanceMeasurement.🎬🤚()
            
            self.isInferencing = false
        }
        self.semaphore.signal()
    }
}

//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return predictions.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell") else {
//            return UITableViewCell()
//        }
//
//        let rectString = predictions[indexPath.row].boundingBox.toString(digit: 2)
//        let confidence = predictions[indexPath.row].labels.first?.confidence ?? -1
//        let confidenceString = String(format: "%.3f", confidence/*Math.sigmoid(confidence)*/)
//
//        cell.textLabel?.text = predictions[indexPath.row].label ?? "N/A"
//        cell.detailTextLabel?.text = "\(rectString), \(confidenceString)"
//        return cell
//    }
//}

// MARK: - 📏(Performance Measurement) Delegate
//extension ViewController: 📏Delegate {
//    func updateMeasure(inferenceTime: Double, executionTime: Double, fps: Int) {
//        //print(executionTime, fps)
//        DispatchQueue.main.async {
//            self.maf1.append(element: Int(inferenceTime*1000.0))
//            self.maf2.append(element: Int(executionTime*1000.0))
//            self.maf3.append(element: fps)
//
//            self.inferenceLabel.text = "inference: \(self.maf1.averageValue) ms"
//            self.etimeLabel.text = "execution: \(self.maf2.averageValue) ms"
//            self.fpsLabel.text = "fps: \(self.maf3.averageValue)"
//        }
//    }
//}

class MovingAverageFilter {
    private var arr: [Int] = []
    private let maxCount = 10
    
    public func append(element: Int) {
        arr.append(element)
        if arr.count > maxCount {
            arr.removeFirst()
        }
    }
    
    public var averageValue: Int {
        guard !arr.isEmpty else { return 0 }
        let sum = arr.reduce(0) { $0 + $1 }
        return Int(Double(sum) / Double(arr.count))
    }

}
