//
//  HomeViewController.swift
//  instagram
//
//  Created by Ali Hadwan on 3/3/16.
//  Copyright © 2016 Ali Hadwan. All rights reserved.
//

import UIKit
import Parse

var picture: [PFObject]?

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    
     var refrechController: UIRefreshControl!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.reloadData()

        tableView.dataSource = self
        tableView.delegate = self
        
        getinfo()
        self.refreshercontorl()
        
          self.refrechController.endRefreshing()
        
        
       
        
                // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        getinfo()
        print("did appear");
        self.refrechController.endRefreshing()
    }

    
    func  refreshercontorl(){
        self.refrechController = UIRefreshControl()
        let label:NSAttributedString = NSAttributedString(string:"")
        refrechController.attributedTitle = label
        
        self.refrechController.addTarget(self,action: "refresher:", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refrechController)
       
    }
    
    func refresher(sender:AnyObject){
        
        self.tableView.reloadData()
     
        self.refrechController.endRefreshing()
         getinfo()
        
    }


    
    
    func getinfo() {
        
        // construct PFQuery
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            if let posts = posts {
                picture = posts
                self.tableView.reloadData()
            } else {
                // handle error
            }
        }
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return picture?.count ?? 0
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PhotosTableViewCell", forIndexPath: indexPath) as! PhotosTableViewCell
        
        if (picture != nil) {
            let object = picture![indexPath.row]
            
            cell.object = object
            
        }
        
        return cell
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
