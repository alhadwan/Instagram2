//
//  PhotosTableViewCell.swift
//  instagram
//
//  Created by Ali Hadwan on 3/3/16.
//  Copyright © 2016 Ali Hadwan. All rights reserved.
//

import UIKit
import Parse

class PhotosTableViewCell: UITableViewCell {
    
    @IBOutlet weak var PhotoView: UIImageView!
    @IBOutlet weak var CaptionLable: UILabel!
    @IBOutlet weak var HomepPhoto: UIImageView!
    @IBOutlet weak var Time: UILabel!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var LikeButton: UIButton!
    @IBOutlet weak var ReplayButton: UIButton!
    @IBOutlet weak var ChatButton: UIButton!
    
     var dateFormatter = NSDateFormatter()
    var topicDate: String!
    var islikeButton: Bool = false
    
    var photo: Photo! {
        didSet {
            print("did set caption and image?")
            PhotoView.image = photo.image
            print("This is the image that is to be set: \(photo.image)")
            CaptionLable.text = photo.caption
            UserName.text = photo.UserName
//            
//            let dateReleased = object!.createdAt as! String
//            
//            let dateFormatter = NSDateFormatter()
//            dateFormatter.dateFormat = "yyyy-MM-dd"
//            let date = dateFormatter.dateFromString(dateReleased)
//            dateFormatter.dateFormat = "MMM d"
//            let dateText = dateFormatter.stringFromDate(date!)
//            cell.date.text = dateText

           Time.text = "\(object!.createdAt!)"
            
            //Time.text = convertDateFormater((goodDate)
        }
    }
    
//    func convertDateFormater(date: String) -> String {
//        
//        let dateFormatter = NSDateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
//        let theDate = dateFormatter.dateFromString(date)
//        dateFormatter.timeZone = NSTimeZone(name: "UTC")
//    
//        guard let date = dateFormatter.dateFromString(date) else {
//        assert(false, "no date from string")
//        return ""
//        }
//    
//        dateFormatter.dateFormat = "yyyy MMM EEEE HH:mm"
//        dateFormatter.timeZone = NSTimeZone(name: "UTC")
//        let timeStamp = dateFormatter.stringFromDate(theDate!)
//        
//        
//    
//        return timeStamp
//        }
    
    var object: PFObject? {
        didSet {
            photo = Photo(object: object!)
            photo!.cell = self;
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func TOLike(sender: AnyObject) {
        
        if self.islikeButton{
            self.LikeButton.setImage(UIImage(named: "iconmonstr-favorite-2-32"), forState: UIControlState.Normal)
            self.islikeButton = false
            
        }else{
            self.LikeButton.setImage(UIImage(named: "Like Filled-32"), forState: UIControlState.Normal)
            self.islikeButton = true

        }
        
        
    }

}
