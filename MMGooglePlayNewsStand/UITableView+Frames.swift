//
//  UITableView+Frames.swift
//  MMGooglePlayNewsStand
//
//  Created by mukesh mandora on 27/08/15.
//  Copyright (c) 2015 madapps. All rights reserved.
//

import UIKit

extension UITableView{
    
    func framesForRowAtIndexPath(indexpath : NSIndexPath) -> CGRect{
        
        let cell = self.cellForRowAtIndexPath(indexpath) as! NewsCellTableViewCell
        
        return self.convertRect(cell.frame, toView: UIApplication.sharedApplication().keyWindow)
        
    }
}
