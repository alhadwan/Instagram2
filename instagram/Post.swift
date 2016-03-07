//
//  Post.swift
//  instagram
//
//  Created by Ali Hadwan on 3/3/16.
//  Copyright © 2016 Ali Hadwan. All rights reserved.
//

import UIKit
import Parse

class Post: NSObject {
    
    class func postUserImage(image: UIImage?, withCaption caption: String?, withCompletion completion: PFBooleanResultBlock?) {
        // Create Parse object PFObject
        let media = PFObject(className: "Post")
        
        
        print("Posting user image")
        // Add relevant fields to the object
        media["media"] = getPFFileFromImage(image) // PFFile column type
        media["author"] = PFUser.currentUser() // Pointer column type that points to PFUser
        media["caption"] = caption
        media["likesCount"] = 0
        media["commentsCount"] = 0
         media["UserName"] = PFUser.currentUser()?.username!
        
        
        
        // Save object (following function will save the object in Parse asynchronously)
        media.saveInBackgroundWithBlock(completion)
        print("user image save complete")

}
    
    class func postUserProfile(image: UIImage?, withCompletion completion: PFBooleanResultBlock?) {
        let media = PFObject(className: "Post")
        
        media["UserName"] = PFUser.currentUser()?.username!
        resize(image!, newSize: CGSize(width: 100, height: 100))
       media["profileImage"] = getPFFileFromImage(image)
        
       media.saveInBackgroundWithBlock(completion)
    }


    class func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        resizeImageView.contentMode = UIViewContentMode.ScaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
}

    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        // check if image is not nil
        if let image = image {
            // get image data and check if that is not nil
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
}

