# MMGooglePlayNewsStand
To Simulate iOS Google Play NewsStand app

####Appstore Link of Google Play Newsstand app
https://itunes.apple.com/in/app/google-play-newsstand/id459182288?mt=8

#### Video preview [Here](https://www.youtube.com/watch?v=WdfkO9LnPkg)

##Demo

![MMGooglePlayNewsStand](https://github.com/mukyasa/MMGooglePlayNewsStand/blob/master/MMGooglePlayNewsStand/newststand.gif)<br />


##How To Setup

* Drag a View Controller and subclass it with ```MMPlayStandPageViewController```
![MMGooglePlayNewsStand](https://github.com/mukyasa/MMGooglePlayNewsStand/blob/master/MMGooglePlayNewsStand/Screen Shot 2015-09-21 at 1.54.27 pm.png)<br />

* In ```AppDelegate``` file instantiate the ```MMPlayStandPageViewController```<br />

```
var walkthrough:MMPlayStandPageViewController?
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let main = UIStoryboard(name: "Main", bundle: nil)
        walkthrough = main.instantiateViewControllerWithIdentifier("playstand") as? MMPlayStandPageViewController
        return true
        }
   ``` 

* Add ViewControllers to  ```MMPlayStandPageViewController``` by calling ```func addViewControllerWithTitleandColor(vc:UIViewController , title:NSString , color:UIColor)->Void```<br />


```
let stb = UIStoryboard(name: "Main", bundle: nil)
let page_zero = stb.instantiateViewControllerWithIdentifier("stand_one") as! MMSampleTableViewController
walkthrough?.addViewControllerWithTitleandColor(page_zero, title: "Highlights", color: UIColor(hexString: "9c27b0"))
walkthrough?.addViewControllerWithTitleandColor(page_one, title: "Sports", color:UIColor(hexString: "009688"))
walkthrough?.addViewControllerWithTitleandColor(page_two, title: "Entertainment", color:UIColor(hexString: "673ab7"))
walkthrough?.addViewControllerWithTitleandColor(page_three, title: "Technology", color: UIColor(hexString: "ff9800"))
walkthrough?.addViewControllerWithTitleandColor(page_four, title: "Business", color: UIColor(hexString: "03a9f4"))
walkthrough?.addViewControllerWithTitleandColor(page_five, title: "World", color: UIColor(hexString: "4caf50"))
```

<br />
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
