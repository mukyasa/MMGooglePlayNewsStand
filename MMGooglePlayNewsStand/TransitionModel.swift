//
//  TransitionModel.swift
//  MMGooglePlayNewsStand
//
//  Created by mukesh mandora on 27/08/15.
//  Copyright (c) 2015 madapps. All rights reserved.
//

import UIKit

class TransitionModel: NSObject , UIViewControllerAnimatedTransitioning , UIViewControllerTransitioningDelegate {
    
    var isPresenting = false as Bool
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.8;
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        if(isPresenting){
            let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! MMPlayStandPageViewController
            
            let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! DetailViewController

            toVC.view.alpha=0
            transitionContext.containerView()!.addSubview(toVC.view)
            
            let snapshot = UIView()
            snapshot.backgroundColor=UIColor.whiteColor()
//            snapshot.frame = fromVC.tableView.framesForRowAtIndexPath(fromVC.tableView.indexPathForSelectedRow()!)
            snapshot.frame = fromVC.getframeindexpathOfController()
            snapshot.frame=CGRectMake(16, snapshot.frame.origin.y, snapshot.frame.width-32, snapshot.frame.height)
//            NSLog("%@", snapshot)
            toVC.dismissFrame = snapshot.frame
            transitionContext.containerView()!.addSubview(snapshot)
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                
                
                snapshot.frame = fromVC.view.frame
                
                
            }, completion: { (Bool) -> Void in
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    toVC.view.alpha=1
                    
                }, completion: { (Bool) -> Void in
                    snapshot.alpha=0;
                    snapshot.removeFromSuperview()
                })
                
                transitionContext.completeTransition(true)
            })
            
        }
        else{
            let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! DetailViewController
            
            var toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! MMPlayStandPageViewController
            
            let snapshot = UIView()
            snapshot.backgroundColor=UIColor.whiteColor()
            snapshot.frame = fromVC.view.frame
            transitionContext.containerView()!.addSubview(snapshot)
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                
                
                fromVC.view.alpha=0
                snapshot.frame = fromVC.dismissFrame
                fromVC.navBar.frame=CGRectMake(0, -64, fromVC.view.frame.width, 64)
                
                
                }, completion: { (Bool) -> Void in
                    UIView.animateWithDuration(0.2, animations: { () -> Void in
                        snapshot.alpha=0;
                       
                    })
                    snapshot.removeFromSuperview()
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
            })

        }
        
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresenting=true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        
        isPresenting=false
        return self
    }
   
}
