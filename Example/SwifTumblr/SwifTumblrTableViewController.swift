//
//  SwifTumblrTableViewController.swift
//  SwifTumblr
//
//  Created by Takahashi Yosuke on 2015/10/15.
//  Copyright © 2015年 CocoaPods. All rights reserved.
//

import UIKit
import SwifTumblr

class SwifTumblrTableViewController: UITableViewController {

    var blog: Blog? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SwifTumblr.getBlog(
            URLString: "http://ysn-blog.tumblr.com/api/read",
            success: { blog in
                debugPrint(blog)
                self.blog = blog
                self.tableView.reloadData()
            },
            failure: { error in
                debugPrint(error)
            }
        )
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let _ = self.blog {
            return 1
        } else {
            return 0
        }
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let blog = self.blog, let posts = blog.posts {
            return posts.count
        } else {
            return 0
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        if let blog = self.blog, let posts = blog.posts {
            cell.textLabel?.text = posts[indexPath.row].slug
        }

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
