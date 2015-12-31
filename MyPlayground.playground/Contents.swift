//: Playground - noun: a place where people can play

import UIKit
import QuartzCore

// TODO: Add autolayout.

class NameTag {
    let introduction = "Hello"
    let view = UIView(frame: CGRectMake(0, 0, 200, 100))
    let nameLabel = UILabel()
    let introductionlabel = UILabel()
    let borderWidth: CGFloat = 10.0

    init(name: String!) {
        self.setupView()
        self.setupLabels()
        
        if ((name) != nil) {
            self.setName(name)
        }
        
        self.view.addSubview(self.introductionlabel)
        self.view.addSubview(self.nameLabel)
    }
    
    func layout() {
        var introductionToViewConstraint = NSLayoutConstraint(
            item: self.introductionlabel,
            attribute: NSLayoutAttribute.Top,
            relatedBy: <#T##NSLayoutRelation#>,
            toItem: <#T##AnyObject?#>,
            attribute: <#T##NSLayoutAttribute#>,
            multiplier: <#T##CGFloat#>,
            constant: <#T##CGFloat#>
        )
        
        
        var intoductionToNameConstraint = NSLayoutConstraint(
            item: self.introductionlabel,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.nameLabel,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1.0,
            constant: 0
        )
        
        
        let introductionFrame = CGRectMake(
            self.borderWidth,
            0,
            self.view.frame.size.width - self.borderWidth * 2,
            40
        )
        
        let nameFrame = CGRectMake(
            0,
            introductionFrame.size.height + introductionFrame.origin.y,
            self.view.frame.size.width,
            self.view.frame.size.height - introductionFrame.size.height - (self.borderWidth))
        
        self.introductionlabel.frame = introductionFrame
        self.nameLabel.frame = nameFrame
    }
    
    func setName(name: String) {
        self.nameLabel.text = name
    }
    
    private func setupView() {
        self.view.layer.borderColor = UIColor.redColor().CGColor
        self.view.layer.borderWidth = self.borderWidth
        self.view.layer.cornerRadius = 8
        self.view.clipsToBounds = true
    }
    
    private func setupLabels() {
        self.introductionlabel.backgroundColor = UIColor.redColor()
        self.introductionlabel.textAlignment = NSTextAlignment.Center
        self.introductionlabel.textColor = UIColor.whiteColor()
        self.introductionlabel.font = UIFont.boldSystemFontOfSize(18)
        self.introductionlabel.text = self.introduction
        
        self.nameLabel.backgroundColor = UIColor.whiteColor()
        self.nameLabel.textColor = UIColor.blackColor()
        self.nameLabel.font = UIFont.italicSystemFontOfSize(20)
        self.nameLabel.textAlignment = NSTextAlignment.Center
    }
}


let matt = "Matt Salmon"
let tag = NameTag(name: matt)
tag.layout()





