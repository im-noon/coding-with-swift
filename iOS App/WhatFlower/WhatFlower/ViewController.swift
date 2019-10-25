//
//  ViewController.swift
//  WhatFlower
//
//  Created by Slimn Srarena on 14/10/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import UIKit
import CoreML
import Vision
import Alamofire
import SwiftyJSON
import SDWebImage
import ProgressHUD

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var flowerDescription: UILabel!
    
    let wikipediaURl = "https://en.wikipedia.org/w/api.php"
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        print("Ready...")
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickImage = info[.editedImage] as? UIImage {
            imageView.image = pickImage
            
            guard let ciimage = CIImage(image: pickImage) else {
                fatalError("Image Error!")
            }
            ProgressHUD.show("Processing...")
            detectFlower(image: ciimage, placeholderImage: pickImage)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func detectFlower(image : CIImage, placeholderImage : UIImage) {
        guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else {
            fatalError("Loading Model fail!")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let classification = request.results?.first as? VNClassificationObservation else {
                fatalError(error!.localizedDescription)
            }
            
            print(classification)
            
            let flowerName = classification.identifier.capitalized
            self.navigationItem.title = flowerName
            self.requestDescriptionOfFlower(flowerName: flowerName, placeholderImage: placeholderImage)
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        do {
            try handler.perform([request])
        }
        catch {
            ProgressHUD.showError(error.localizedDescription)
        }
        
    }
    
    func reuestThumbnailFromURL(url : String) {
        self.imageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "placeholder.png"))
    }
    
    func requestDescriptionOfFlower(flowerName : String, placeholderImage : UIImage) {
        let parameters : [String:String] = [
            "format" : "json",
            "action" : "query",
            "prop" : "extracts|pageimages",
            "exintro" : "",
            "explaintext" : "",
            "titles" : flowerName,
            "indexpageids" : "",
            "redirects" : "1",
            "odthumbsize" : "500"
        ]
        
        AF.request(wikipediaURl,
                   method: .post,
                   parameters: parameters).responseJSON { response in switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        let pageids = json["query"]["pageids"][0].stringValue
                        let description = json["query"]["pages"][pageids]["extract"].stringValue
                        let thumbnail = json["query"]["pages"][pageids]["thumbnail"]["source"].stringValue
 
                        self.flowerDescription.text = description
                        self.imageView.sd_setImage(with: URL(string: thumbnail), placeholderImage: placeholderImage)
                    
                        ProgressHUD.dismiss()
                    
                    case .failure(let error):
                        ProgressHUD.showError("Request Fail!")
                    }
        }
    }

    @IBAction func photoLibraryTapped(_ sender: UIBarButtonItem) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        
        if(UIImagePickerController .isSourceTypeAvailable(.camera)) {
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        else {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

