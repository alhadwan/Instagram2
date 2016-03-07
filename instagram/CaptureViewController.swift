//
//  CaptureViewController.swift
//  instagram
//
//  Created by Ali Hadwan on 3/3/16.
//  Copyright © 2016 Ali Hadwan. All rights reserved.
//

import UIKit
import Parse

class CaptureViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let takerimage = UIImagePickerController()
    var image = UIImage()
    

    @IBOutlet weak var CaptionName: UITextField!
    @IBOutlet weak var UserPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        takerimage.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func TakeImage(sender: AnyObject) {
        print("add image button clicked")
        
       takerimage.delegate = self
        takerimage.allowsEditing = true
       takerimage.sourceType = UIImagePickerControllerSourceType.Camera
        print("Image picker vc displayed")
        self.presentViewController(takerimage, animated: true, completion: nil)
        
    }
    
    
    @IBAction func onPhotosSelected(sender: AnyObject) {
        takerimage.delegate = self
        takerimage.allowsEditing = true
     takerimage.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(takerimage, animated: true, completion: nil)
    }
    
       @IBAction func onSubmitImage(sender: AnyObject) {
        print("Submit button clicked")
        
        let newImage = Post.resize(image, newSize: CGSize(width: 300, height: 500))
        Post.postUserImage(newImage, withCaption: CaptionName.text) { (success: Bool, error: NSError?) -> Void in
            if success{
                print("saved")
            }else{
                
                print("not saved")
            }
            
            self.tabBarController?.selectedIndex = 0
        }
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func onTap(sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    
    func saveToCamera(image: UIImage?) {
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            let originalPhoto = info[UIImagePickerControllerOriginalImage] as! UIImage
            _ = info[UIImagePickerControllerEditedImage] as! UIImage
            image = originalPhoto
            saveToCamera(image)
            dismissViewControllerAnimated(true, completion: nil)
            self.UserPhoto.image = image
    }
    
    
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
