//
//  CameraViewController.swift
//  instagramApp
//
//  Created by Kent Brylle Canonigo on 10/11/22.
//

import UIKit
import AlamofireImage

// Adds picker controller delegate to pick the image to choose on camera
class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    
    @IBOutlet weak var cameraImageView: UIImageView!
    
    @IBOutlet weak var commentText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSubmit(_ sender: Any) {
    }
    
    // When image is tapped, launches camera
    @IBAction func onCamera(_ sender: Any) {
        let picker = UIImagePickerController()
        // When user is done picking a photo, calls back picker
        picker.delegate = self
        // Presents editing to tweak photo before finishing up
        picker.allowsEditing = true
        
        // After creating controller, check to see if camera is avaialable, otherwise use photo library
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    // After image picker is done choosing, present the image onto UIView
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        // Resize image
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af.imageScaled(to: size)
        
        cameraImageView.image = scaledImage
        
        // Dismiss the camera view when finished
        dismiss(animated: true, completion: nil)
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
