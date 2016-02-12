# MMGooglePlayNewsStand
To Simulate iOS Google Play NewsStand app


####Objective-C Version released 

##### So Finally i was able to make Objective-C version of this, Sorry For Delay My Friends, Got lot of request for this so thought of doing this for my community friends.Feel free to use an integrate it in your project.If you look in to project i have made Objective code much cleaner and easy to use compare to Swift.Future work will be making the swift code more simple and cleaner.I will suggest to use the ObjCPlayStand in your project because Swift code is not a plug and play type, But with help of Bridging header you can use it easily.Check for demo how to use it both in Objective-C/Swift.

####Appstore Link of Google Play Newsstand app
https://itunes.apple.com/in/app/google-play-newsstand/id459182288?mt=8

#### Video preview [Here](https://www.youtube.com/watch?v=WdfkO9LnPkg)

##Demo

![MMGooglePlayNewsStand](https://github.com/mukyasa/MMGooglePlayNewsStand/blob/master/MMGooglePlayNewsStand/newststand.gif)<br />

##Files Required 
`MMContainerViewController`

`MMMenuScroll`

`BaseViewController`

`UIView+MaterialDesign`

`UIColor+HexRepresentation`

`JBKenBurnsView`


##Example Usage Objective-C Project
```
//In view did load init the view controllers
 MMTableViewController *vc_one = [self.storyboard instantiateViewControllerWithIdentifier:@"demo"];
    vc_one.title = @"Highlights";
    vc_one.logoColor = @"4caf50";
    vc_one.logoImage = @"highlights";
    
    MMTableViewController *vc_two = [self.storyboard instantiateViewControllerWithIdentifier:@"demo"];
    vc_two.title = @"Sports";
    vc_two.logoColor = @"009688";
    vc_two.logoImage = @"sports";

    MMTableViewController *vc_three = [self.storyboard instantiateViewControllerWithIdentifier:@"demo"];
    vc_three.title = @"Entertainment";
    vc_three.logoColor = @"673ab7";
    vc_three.logoImage = @"movie";

    MMTableViewController *vc_four = [self.storyboard instantiateViewControllerWithIdentifier:@"demo"];
    vc_four.title = @"News";
    vc_four.logoColor = @"ff9800";
    vc_four.logoImage = @"world";

    
    MMCollectionViewController *vc_five = [self.storyboard instantiateViewControllerWithIdentifier:@"collection"];
    vc_five.title = @"Technology";
    vc_five.logoColor = @"9c27b0";
    vc_five.logoImage = @"tech";


     //init the view container controller
    self.containerVC = [[MMContainerViewController alloc] initWithControllers:@[vc_one , vc_two , vc_three , vc_four,vc_five] parentViewController:self];
    vc_one.scrolldeleagte = self.containerVC ;
    vc_two.scrolldeleagte = self.containerVC ;
    vc_three.scrolldeleagte = self.containerVC ;
    vc_four.scrolldeleagte = self.containerVC ;
    vc_five.scrolldeleagte = self.containerVC ;
    
     //init the colors
    self.containerVC.itemViewColorArray = @[@"4caf50",@"009688",@"673ab7",@"ff9800",@"9c27b0"];
    
    //init the font
    self.containerVC.menuItemFont = [UIFont fontWithName:@"Roboto-Medium" size:15];
    //init the indicator color
    self.containerVC.menuIndicatorColor = [UIColor whiteColor];
    
    //init the images used in kensburn
    self.containerVC.images = @[[UIImage imageNamed:@"ironman.jpg"],[UIImage imageNamed:@"worldbg.jpg"],[UIImage imageNamed:@"sportsbg.jpg"],[UIImage imageNamed:@"applebg.png"],[UIImage imageNamed:@"businessbg.jpg"]];

    [self.view addSubview:self.containerVC.view];
```

##Example Usage Swift Project with same mechanism

```
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
        containerVC.images = [UIImage(named: "ironman.jpg")!,UIImage(named: "worldbg.jpg")!,UIImage(named: "sportsbg.jpg")!,UIImage(named: "applebg.png")!,UIImage(named: "businessbg.jpg")!]


        view.addSubview(containerVC.view);
```



####Credits
* JBKenBurns (https://github.com/jberlana/JBKenBurns) for KenBurns Effect
* ios-material-design (https://github.com/moqod/ios-material-design) for Ripple Effect



**My Other Repositories**

**MMPaper:**<br />
https://github.com/mukyasa/MMPaper<br />

**MMCamScanner:**<br />
https://github.com/mukyasa/MMCamScanner<br />

**MMTextFieldEffects:**<br />
https://github.com/mukyasa/MMTextFieldEffects<br />

**MMPaperPanFlip:**<br /> 
https://github.com/mukyasa/MMPaperPanFlip<br />

**MMTransitionEffect:**<br />
https://github.com/mukyasa/MMTransitionEffect<br />

Contact Me
==========
Mukesh Mandora

Contact: mandoramuku07@gmail.com

Twitter: http://twitter.com/mandymuku

LinkedIn: https://in.linkedin.com/in/mukeshmandora

Github:https://github.com/mukyasa


## License
MMGooglePlayNewsStand is available under the Apache license. See the LICENSE file for more info.
