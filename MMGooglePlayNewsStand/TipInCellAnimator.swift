//
//  TipInCellAnimator.swift
//  CardTilt
//
//  Created by Eric Cerney on 7/10/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit
import QuartzCore

let TipInCellAnimatorStartTransform:CATransform3D = {
  let rotationDegrees: CGFloat = 35.0
  let rotationRadians: CGFloat = rotationDegrees * (CGFloat(M_PI)/180.0)
  let offset = CGPointMake(-20, 400)
  var startTransform = CATransform3DIdentity
  startTransform = CATransform3DRotate(CATransform3DIdentity,
    rotationRadians, 0.0, 0.0, 1.0)
  startTransform = CATransform3DTranslate(startTransform, offset.x, offset.y, 0.0)

  return startTransform
  }()




class TipInCellAnimator {
  class func animate(cell:UITableViewCell) {
    let view = cell.contentView

    view.layer.transform = TipInCellAnimatorStartTransform
    
//    view.layer.opacity = 0.8
    
    
    UIView.animateWithDuration(0.4) {
      view.layer.transform = CATransform3DIdentity
      view.layer.opacity = 1
    }
  }
}
