//
//  CameraScreenViewController.swift
//  NetLog
//
//  Created by ENES AKSOY on 20.02.2021.
//  Copyright © 2021 Enes Aksoy. All rights reserved.
//

import UIKit

class CameraScreenViewController: UIViewController, UINavigationControllerDelegate  {

    // MARK: - Proporties
    var imagePicker: UIImagePickerController!

    // MARK: - Outlets
    @IBOutlet weak var imageTake: UIImageView!
    @IBOutlet weak var imageDeleteButton: UIButton!
    
    
    
    enum ImageSource {
        case photoLibrary
        case camera
    }
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            selectImageFrom(.photoLibrary)
            return
        }
        selectImageFrom(.camera)
    }
    
    // MARK: - Actions
    
    @IBAction func againTakeButtonClicked(_ sender: Any) {
        self.imageTake.image = nil
        self.imageDeleteButton.isHidden = true
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            selectImageFrom(.photoLibrary)
            return
        }
        selectImageFrom(.camera)
    }
    
    @IBAction func sendButtonClicked(_ sender: Any) {
        ObjectStore.shared.selectImage = self.imageTake.image?.pngData()
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        createAlert(message: NSLocalizedString("MissingDataMessage", comment: ""), title: NSLocalizedString("AlertTitle", comment: ""))
    }
    
    @IBAction func deleteImageButtonClicked(_ sender: Any) {
        self.imageTake.image = nil
        self.imageDeleteButton.isHidden = true
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            selectImageFrom(.photoLibrary)
            return
        }
        selectImageFrom(.camera)
    }
    
    @IBAction func closeButtonClicked(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Take image

    func selectImageFrom(_ source: ImageSource){
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        switch source {
        case .camera:
            imagePicker.sourceType = .camera
        case .photoLibrary:
            imagePicker.sourceType = .photoLibrary
        }
        present(imagePicker, animated: true, completion: nil)
    }
 }

// MARK: - UIImagePickerControllerDelegate

 extension CameraScreenViewController: UIImagePickerControllerDelegate{

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        imagePicker.dismiss(animated: true, completion: nil)
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("Image not found!")
            return
        }
        
        imageTake.image = selectedImage
        self.imageDeleteButton.isHidden = false
    }
}
