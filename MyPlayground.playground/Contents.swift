// A Swift playground that builds a name tag UI element.

import UIKit
import QuartzCore
import XCPlayground

class NameTag {
    var introduction = "Hello, my name is:"
    let view = UIView(frame: CGRectMake(0, 0, 400, 150))
    let nameLabel = UILabel()
    let introductionlabel = UILabel()
    let borderWidth: CGFloat = 10.0

    init(name: String!, greeting: String!) {
        self.setupView()
        self.setupLabels()
        
        if ((greeting) != nil) {
            self.introduction = greeting
        }
        
        if ((name) != nil) {
            self.setName(name)
        }
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
        self.introductionlabel.font = UIFont.boldSystemFontOfSize(24)
        self.introductionlabel.text = self.introduction
        self.introductionlabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.nameLabel.backgroundColor = UIColor.whiteColor()
        self.nameLabel.textColor = UIColor.blackColor()
        self.nameLabel.font = UIFont.italicSystemFontOfSize(30)
        self.nameLabel.textAlignment = NSTextAlignment.Center
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.introductionlabel)
        self.view.addSubview(self.nameLabel)
        
        // Introduction constraints
        let introductionTopMargin = NSLayoutConstraint(
            item: self.introductionlabel,
            attribute: NSLayoutAttribute.LeadingMargin,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1.0,
            constant: self.view.layer.borderWidth
        )
        
        let introductionToViewConstraint = NSLayoutConstraint(
            item: self.introductionlabel,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1.0,
            constant: 0
        )
        
        let introductionHeightConstraint = NSLayoutConstraint(
            item: self.introductionlabel,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1.0,
            constant: 40
        )
        
        let introductionWidthConstraint = NSLayoutConstraint(
            item: self.introductionlabel,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1.0,
            constant: 0
        )
        
        // Name constraints
        self.view.addConstraints([
            introductionTopMargin,
            introductionToViewConstraint,
            introductionHeightConstraint,
            introductionWidthConstraint])
        
        let nameToIntroductionConstraint = NSLayoutConstraint(
            item: self.nameLabel,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.introductionlabel,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: 0
        )
        
        let nameHeightConstraint = NSLayoutConstraint(
            item: self.nameLabel,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: -10
        )
        
        let nameWidthConstraint = NSLayoutConstraint(
            item: self.nameLabel,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.view,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1.0,
            constant:0
        )
        
        self.view.addConstraints([
            nameHeightConstraint,
            nameWidthConstraint,
            nameToIntroductionConstraint
        ])
    }
}

let playgroundPage = XCPlayground.XCPlaygroundPage
let name = "John Smith"
let tag = NameTag(name: name, greeting: nil)
playgroundPage.currentPage.liveView = tag.view
