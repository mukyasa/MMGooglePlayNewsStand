//
//  MMSampleTableViewController.swift
//  MMGooglePlayNewsStand
//
//  Created by mukesh mandora on 25/08/15.
//  Copyright (c) 2015 madapps. All rights reserved.
//

import UIKit

@objc protocol scrolldelegateForYAxis{
    
    @objc optional func scrollYAxis(offset:CGFloat , translation:CGPoint)              // If the skipRequest(sender:) action is connected to a button, this function is called when that button is pressed.
    
    @objc optional func getframeindexpathOfController()->CGRect
}

class MMSampleTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,MMPlayPageScroll ,UIScrollViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    let header: UIView!
    let headerImage: UIImageView!
    var trans:CGPoint
    var imageArr:[UIImage]!
    var transitionManager : TransitionModel!
    var preventAnimation = Set<NSIndexPath>()
    
    //     weak var scrolldelegate:scrolldelegateForYAxis?
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var tag = 0 as Int
    override func viewDidLoad() {
        
        transitionManager = TransitionModel()
        super.viewDidLoad()
        self.tableView.delegate=self;
        self.tableView.dataSource=self;
        self.tableView.decelerationRate=UIScrollViewDecelerationRateFast
        header.frame=CGRectMake(0, 0, self.view.frame.width, 200);
        headerImage.frame=CGRectMake(header.center.x-30, header.center.y-30, 60, 60)
        headerImage.layer.cornerRadius=headerImage.frame.width/2
        
        
       
        headerImage.tintColor=UIColor.whiteColor()
        
        
        header.backgroundColor=UIColor.clearColor()
        
        //        header.addSubview(headerImage)
        initHeadr()
        self.view.addSubview(headerImage)
        self.tableView.tableHeaderView=header;
        // Do any additional setup after loading the view.
        self.setNeedsStatusBarAppearanceUpdate()
        
        imageArr.append(UIImage(named: "ironman.jpg")!)
        imageArr.append(UIImage(named: "worldbg.jpg")!)
        imageArr.append(UIImage(named: "sportsbg.jpg")!)
        imageArr.append(UIImage(named: "applebg.png")!)
        imageArr.append(UIImage(named: "businessbg.jpg")!)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        header=UIView()
        headerImage=UIImageView()
        headerImage.backgroundColor=UIColor(hexString: "109B96")
        headerImage.contentMode=UIViewContentMode.Center
        headerImage.clipsToBounds=true
        trans=CGPointMake(0, 0)
        imageArr = Array()
        super.init(coder: aDecoder)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func initHeadr(){
        //header Color
  
        switch ( tag){
        case 1:
             headerImage.backgroundColor=UIColor(hexString: "9c27b0")
            headerImage.image=UIImage(named: "highlights")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            break
            
        case 2:
             headerImage.backgroundColor=UIColor(hexString: "009688")
              headerImage.image=UIImage(named: "sports")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            break
            
        case 3:
             headerImage.backgroundColor=UIColor(hexString: "673ab7")
              headerImage.image=UIImage(named: "movie")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            break
            
        case 4:
             headerImage.backgroundColor=UIColor(hexString: "ff9800")
              headerImage.image=UIImage(named: "tech")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            break
            
        case 5:
             headerImage.backgroundColor=UIColor(hexString: "03a9f4")
              headerImage.image=UIImage(named: "business")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            break
            
        default:
             headerImage.backgroundColor=UIColor(hexString: "4caf50")
              headerImage.image=UIImage(named: "world")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
            break
        }
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
     func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if !preventAnimation.contains(indexPath) {
            preventAnimation.insert(indexPath)
            TipInCellAnimator.animate(cell)
        }
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:NewsCellTableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! NewsCellTableViewCell
        
        cell.headerImage.image=imageArr[indexPath.row]
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detail = self.storyboard?.instantiateViewControllerWithIdentifier("detail") as! DetailViewController
        detail.modalPresentationStyle = UIModalPresentationStyle.Custom;
        detail.transitioningDelegate = transitionManager;
        appDelegate.walkthrough?.presentViewController(detail, animated: true, completion: nil)
//        self.presentViewController(detail, animated: true, completion: nil)

    }
    
    //MARK:  - Scroll delegate
    
    func walkthroughDidScroll(position:CGFloat, offset:CGFloat) {
        //        NSLog("In controller%f %f", offset,position)
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        trans = CGPointMake(scrollView.contentOffset.x, scrollView.contentOffset.y);
        appDelegate.walkthrough!.scrollYAxis(scrollView.contentOffset.y, translation: trans)
    }
    
    
    
    
}

