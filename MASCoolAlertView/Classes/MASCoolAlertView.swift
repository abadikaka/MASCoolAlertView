//
//  MASCoolAlertView.swift
//  MASCoolAlertView
//
//  Created by Michael Abadi Santoso on 10/22/17.
//  Copyright © 2017 michaelabadi.com. All rights reserved.
//

import UIKit

/**
 * @brief UIView extension for make the round corners
 */
extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

/**
 * @brief Enumeration for the effect of the animation
 * @case curveEaseInOut for ease in out
 * @case curveEaseIn for ease in
 * @case curveEaseOut for ease out
 * @case specialCurve for bouncing effect
 */
public enum MASEffect {
    case curveEaseInOut
    case curveEaseIn
    case curveEaseOut
    case specialCurve
}

/**
 * MASCoolAlertView Class
 */
public class MASCoolAlertView: UIView {
    
    var duration : Double?
    var delay : Double?
    var width : Double?
    var height : Double?
    var cornerRadius : Double?
    public var topView: UIView?
    var bottomViewHeight: Double?
    
    /**
     * @discussion variable handle bottom button for custom button
     */
    public var handleBottomButton : ()->Void = {
        let void = ({
            
        })
        return void
    }()
    
    /**
     * @discussion Initialization of the class.
     * @param height is the height of whole view
     * @param width is the width of whole view
     * @param cornerRadius is the corner radius we want to create
     * @param backgroundColor is the color of the view
     */
    public init(height: Double, width: Double, cornerRadius: Double, backgroundColor: UIColor) {
        super.init(frame: CGRect(x: 0, y: 0, width: width, height: height))
        self.handleBottomButton = { [weak self] in
            return self?.defaultHandleButton()
        }
        self.height = height
        self.width = width
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.transform = self.transform.scaledBy(x: 0.1, y: 0.1)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /**
     * @brief function for default close button.
     * @param sender is the button
     */
    @objc private func handleCloseButton(sender:UIButton){
        self.close(duration: self.duration!, delay: self.delay!)
    }
    
    /**
     * @brief function for injectable / external bottom button.
     */
    @objc private func handleButton(){
        self.handleBottomButton()
    }
    
    /**
     * @brief function for default close button.
     */
    private func defaultHandleButton(){
        self.close(duration: self.duration!, delay: self.delay!)
    }
    
    /**
     * @discussion function for create the close button.
     * @param tintColor is the color of the tint image
     * @param imageName is the name of the image
     * @param buttonSize is the size of the button
     */
    public func createCloseButton(tintColor: UIColor, imageNamed: String, buttonSize: CGFloat){
        let closeButton = UIButton(type: .custom)
        let origImage = UIImage(named: imageNamed)
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        closeButton.setImage(tintedImage, for: UIControlState.normal)
        closeButton.tintColor = tintColor
        self.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        let heightConstraint = NSLayoutConstraint(item: closeButton, attribute: .height, relatedBy: .equal,toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: buttonSize
        )
        
        let widthConstraint = NSLayoutConstraint(item: closeButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: buttonSize
        )
        
        let constant = 90 - (CGFloat(self.width!)/2)
        let rightConstraint = NSLayoutConstraint(item: closeButton, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: CGFloat(constant)
        )
        
        let topConstraint = NSLayoutConstraint(item: closeButton, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 10
        )
        
        closeButton.addConstraint(heightConstraint)
        closeButton.addConstraint(widthConstraint)
        self.addConstraint(topConstraint)
        self.addConstraint(rightConstraint)
        closeButton.addTarget(self, action: #selector(self.handleCloseButton(sender:)), for: .touchUpInside)
    }
    
    /**
     * @discussion function to set the title bar border
     * @param borderWidth is the width of the border
     * @param borderColor is the color of the border
     */
    public func setTitleBarBorder(borderWidth: Double, borderColor: UIColor){
        let border = CALayer()
        border.backgroundColor = borderColor.cgColor
        border.frame = CGRect(x:0, y:self.subviews.first!.frame.size.height - CGFloat(borderWidth), width:self.subviews.first!.frame.size.width, height:CGFloat(borderWidth))
        self.layer.addSublayer(border)
    }
    
    /**
     * @discussion function to set the title bar and the top view bar
     * @param height is the height of the title
     * @param backgroundColor is the color of the title view background
     * @param titleColor is the color of the title
     * @param titleText is the text of the title text
     */
    public func setTitleBar(height: Double, backgroundColor: UIColor, titleColor: UIColor, titleText: String){
        let barView = UIView(frame: CGRect(x: 0, y: 0, width: self.width!, height: height))
        barView.backgroundColor = backgroundColor
        barView.roundCorners([.topLeft,.topRight], radius: CGFloat(self.cornerRadius!))
        let textView = UITextView(frame : CGRect(x:0, y:0, width:self.width!-20, height: height - 20))
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = titleColor
        textView.backgroundColor = .clear
        textView.text = titleText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isSelectable = false
        textView.center = barView.center
        barView.addSubview(textView)
        self.addSubview(barView)
        self.topView = barView
    }
    
    /**
     * @discussion function to set the body content
     * @brief all params are optional
     * @param bodyBackgroundColor is the body background color
     * @param bodyTextColor is the color of the body text
     * @param bodyView is the body custom view
     * @param bodyText is the text in the default body
     */
    public func setBodyContent(bodyBackgroundColor: UIColor?, bodyTextColor: UIColor?,bodyText: String?, bodyView: UIView?){
        if let bodyView = bodyView {
            self.addSubview(bodyView)
        }else{
            
            let screenWidth = self.bounds.width;
            let screenHeight = self.bounds.height;
            let textView = UITextView(frame : CGRect(x:0, y:0, width:(screenWidth-20), height: (screenHeight/3)))
            
            textView.translatesAutoresizingMaskIntoConstraints = false
            if let bodyTextColor = bodyTextColor {
                textView.textColor = bodyTextColor
            }
            
            if let bodyBackgroundColor = bodyBackgroundColor {
                textView.backgroundColor = bodyBackgroundColor
            }
            
            if let bodyText = bodyText {
                textView.text = bodyText
            }
            
            textView.textAlignment = .center
            textView.isEditable = false
            textView.isSelectable = false
            textView.center = self.center
            
            self.addSubview(textView)
        }
    }
    
    /**
     * @discussion function to set the footer button
     * @param buttonText is the text of the button
     * @param buttonColor is the color of the button
     * @param buttonTextColor is the button text color
     * @param height is the height of the button
     */
    public func setFooterButton(buttonText: String, buttonColor: UIColor, buttonTextColor: UIColor, height: Double){
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.backgroundColor = buttonColor
        button.layer.cornerRadius = 5
        button.setTitle(buttonText, for: .normal)
        button.tintColor = buttonTextColor
        self.addSubview(button)
        
        let heightConstraint = NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: nil,            attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(height)
        )
        
        button.addConstraint(heightConstraint)
        
        let rightConstant = 90 - (CGFloat(self.width!)/2)
        let rightConstraint = NSLayoutConstraint(item: button, attribute: .right, relatedBy: .equal, toItem: self,
                                                 attribute: .right, multiplier: 1.0, constant: CGFloat(rightConstant)
        )
        
        let bottomConstant = 90 - (CGFloat(self.height!)/2)
        let bottomConstraint = NSLayoutConstraint(item: button, attribute: .bottom, relatedBy: .equal, toItem: self,
                                                  attribute: .bottom, multiplier: 1, constant: CGFloat(bottomConstant)
        )
        
        let leftConstant = 10
        let leftConstraint = NSLayoutConstraint(item: button, attribute: .left, relatedBy: .equal, toItem: self,            attribute: .left, multiplier: 1.0, constant: CGFloat(leftConstant)
        )
        self.addConstraint(rightConstraint)
        self.addConstraint(bottomConstraint)
        self.addConstraint(leftConstraint)
        self.bottomViewHeight = height
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
    }
    
    /**
     * @discussion function to show the animation
     * @param duration is the duration to show
     * @param delay is the delay time before show
     * @param options is the choice of animation -- see MASEffect enum
     */
    public func show(duration: Double, delay: Double, options: MASEffect){
        self.duration = duration
        self.delay = delay
        switch options {
        case .curveEaseIn:
            self.center = CGPoint(x: superview!.center.x, y: superview!.center.y)
            UIView.animate(withDuration: duration, delay: delay, options: .curveEaseIn, animations: {
                self.superview!.backgroundColor = self.superview!.backgroundColor?.withAlphaComponent(0.5)
                let scaleX = 15
                let scaleY = 15
                self.transform = self.transform.scaledBy(x: CGFloat(scaleX), y: CGFloat(scaleY))
            })
        case .curveEaseInOut:
            self.center = CGPoint(x: superview!.center.x, y: superview!.center.y)
            UIView.animate(withDuration: duration, delay: delay, options: .curveEaseInOut, animations: {
                self.superview!.backgroundColor = self.superview!.backgroundColor?.withAlphaComponent(0.5)
                let scaleX = 15
                let scaleY = 15
                self.transform = self.transform.scaledBy(x: CGFloat(scaleX), y: CGFloat(scaleY))
            })
        case .curveEaseOut:
            self.center = CGPoint(x: superview!.center.x, y: superview!.center.y)
            UIView.animate(withDuration: duration, delay: delay, options: .curveEaseOut, animations: {
                self.superview!.backgroundColor = self.superview!.backgroundColor?.withAlphaComponent(0.5)
                let scaleX = 15
                let scaleY = 15
                self.transform = self.transform.scaledBy(x: CGFloat(scaleX), y: CGFloat(scaleY))
            })
        case .specialCurve:
            self.center = CGPoint(x: superview!.center.x, y: superview!.center.y)
            UIView.animate(withDuration: duration, delay: delay, options: .curveEaseOut, animations: {
                self.superview!.backgroundColor = self.superview!.backgroundColor?.withAlphaComponent(0.5)
                let scaleX = 15
                let scaleY = 15
                self.transform = self.transform.scaledBy(x: CGFloat(scaleX), y: CGFloat(scaleY))
            }) { (value) in
                UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {
                    //self.alpha = 1.0
                    let scaleX = 0.8
                    let scaleY = 0.8
                    self.transform = self.transform.scaledBy(x: CGFloat(scaleX), y: CGFloat(scaleY))
                })
            }
        }
        
    }
    
    /**
     * @discussion function to close the view
     * @param duration is the duration to close
     * @param delay is the delay time before close
     * @param options is the choice of animation -- see MASEffect enum
     */
    private func close(duration: Double, delay: Double){
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseInOut, animations: {
            self.transform = self.transform.scaledBy(x: 0.1, y: 0.1)
            self.superview!.backgroundColor = self.superview!.backgroundColor?.withAlphaComponent(1)
        }) { (finished) in
            if(finished)
            {
                self.removeFromSuperview()
            }
        }
    }
    
}

