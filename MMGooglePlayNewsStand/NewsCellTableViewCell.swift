//
//  NewsCellTableViewCell.swift
//  MMGooglePlayNewsStand
//
//  Created by mukesh mandora on 25/08/15.
//  Copyright (c) 2015 madapps. All rights reserved.
//

import UIKit

class NewsCellTableViewCell: UITableViewCell {

    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var titleNews: UILabel!
    @IBOutlet weak var descNews: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleNews.font=UIFont(name: "Roboto-Medium", size: 18)
        descNews.font=UIFont(name: "Roboto-Medium", size: 14)
        descNews.textColor=UIColor.lightGrayColor()
        headerImage.clipsToBounds=true
        headerImage.contentMode=UIViewContentMode.ScaleAspectFill
        
        middleView.layer.shadowColor=UIColor.blackColor().CGColor
        middleView.layer.shadowRadius = 8.0
        middleView.layer.shadowOpacity  = 1.0
        middleView.layer.masksToBounds=true
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
