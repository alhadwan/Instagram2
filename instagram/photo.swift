//
//  photo.swift
//  instagram
//
//  Created by Ali Hadwan on 3/3/16.
//  Copyright © 2016 Ali Hadwan. All rights reserved.
//

import UIKit
import Parse

let imageDataSetNotification = "imageDataSet";

class Photo: NSObject {
    
    var image: UIImage?
    var author: PFUser?
    var caption: String?
    var likesCount: Int?
    var  UserName: String?
    var commentsCount: Int?
    var posttime: Int?
    
    var cell: PhotosTableViewCell?
    

    
    
    init(object : PFObject) {
        
        super.init()
        
        // Create Parse object PFObject
        let newObject = object
        
        print("Get details of photo from object")
        // Add relevant fields to the object
        //  author = newObject["author"] as! String
        caption = newObject["caption"] as? String
        likesCount = newObject["likesCount"] as? Int
        commentsCount = newObject["commentsCount"] as? Int
       UserName = newObject["UserName"] as? String
        
        if let newImage = object.valueForKey("media")! as? PFFile {
            
            newImage.getDataInBackgroundWithBlock({ (imageData: NSData?, error: NSError?) -> Void in
                if (error == nil) {
                    print("Image data found.. saving UIImage")
                    let image = UIImage(data: imageData!)
                    print(image)
                    self.image = image
                    self.cell?.photo = self;
                    NSNotificationCenter.defaultCenter().postNotificationName(imageDataSetNotification, object: nil)
                } else {
                    print("could not get image \(error?.localizedDescription)")
                }
                },
                progressBlock: { (int: Int32) -> Void in
                    
            })
        }
    }
    
    
}