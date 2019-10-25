//
//  ViewController.swift
//  That is
//
//  Created by Slimn Srarena on 13/10/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickImage = info[.originalImage] as? UIImage {
            imageView.image = pickImage
            
            guard let ciimage = CIImage(image: pickImage) else {
                fatalError()
            }
            detect(image: ciimage)
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func detect(image: CIImage) {
        
        //guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("Loading CoreML failed!")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError(error!.localizedDescription)
            }
            if let firstResult = results.first {
                self.navigationItem.title = firstResult.identifier
            }
        }
        
        let handler = VNImageRequestHandler(ciImage : image)
        do {
            try handler.perform([request])
        }
        catch {
            fatalError(error.localizedDescription)
        }
        
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
        
    }
    
}

