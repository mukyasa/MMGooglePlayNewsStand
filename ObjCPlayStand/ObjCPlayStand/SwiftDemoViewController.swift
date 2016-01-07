//
//  SwiftDemoViewController.swift
//  ObjCPlayStand
//
//  Created by Mukesh on 07/01/16.
//  Copyright © 2016 Mad Apps. All rights reserved.
//

import UIKit

class SwiftDemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let vc_one = self.storyboard?.instantiateViewControllerWithIdentifier("demo") as? MMTableViewController
        vc_one!.title = "Highlights";
        vc_one!.logoColor = "4caf50";
        vc_one!.logoImage = "highlights";
        
        let vc_two = self.storyboard?.instantiateViewControllerWithIdentifier("demo") as? MMTableViewController
        vc_two!.title = "Sports";
        vc_two!.logoColor = "009688";
        vc_two!.logoImage = "sports";

        let vc_three = self.storyboard?.instantiateViewControllerWithIdentifier("demo") as? MMTableViewController
        vc_three!.title = "Entertainment";
        vc_three!.logoColor = "673ab7";
        vc_three!.logoImage = "movie";
        
        let vc_four = self.storyboard?.instantiateViewControllerWithIdentifier("demo") as? MMTableViewController
        vc_four!.title = "News";
        vc_four!.logoColor = "ff9800";
        vc_four!.logoImage = "world";

        let vc_five = self.storyboard?.instantiateViewControllerWithIdentifier("collection") as? MMCollectionViewController
        vc_five!.title = "Technology";
        vc_five!.logoColor = "9c27b0";
        vc_five!.logoImage = "tech";
        
        let containerVC = MMContainerViewController(controllers: [vc_one! , vc_two! , vc_three! , vc_four!,vc_five!], parentViewController: self)
        vc_one!.scrolldeleagte = containerVC ;
        vc_two!.scrolldeleagte = containerVC
        vc_three!.scrolldeleagte = containerVC
        vc_four!.scrolldeleagte = containerVC
        vc_five!.scrolldeleagte = containerVC
        
        containerVC.itemViewColorArray = ["4caf50","009688","673ab7","ff9800","9c27b0"];
        containerVC.menuItemFont = UIFont(name: "Roboto-Medium", size: 15)
        containerVC.menuIndicatorColor = UIColor.whiteColor()

        view.addSubview(containerVC.view);


        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
