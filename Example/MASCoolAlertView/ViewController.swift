//
//  ViewController.swift
//  MASCoolAlertView
//
//  Created by Michael Abadi Santoso on 10/22/17.
//  Copyright © 2017 michaelabadi.com. All rights reserved.
//

import UIKit
import MASCoolAlertView

class ViewController: UIViewController {

    var newAlert : MASCoolAlertView?
    
    @IBOutlet var myButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func showAlert(_ sender: UIButton) {
        
        // create new MASCoolAlertView
        self.newAlert = MASCoolAlertView(height: 200, width: 200, cornerRadius: 10, backgroundColor: .yellow)
        
        // add it to subView
        self.view.addSubview(newAlert!)
        
        // set the title bar
        self.newAlert!.setTitleBar(height: 50, backgroundColor: .green, titleColor: .blue, titleText: "Title")
        
        // set the title bar border
        self.newAlert!.setTitleBarBorder(borderWidth: 1, borderColor: .red)
        
        // create the close button
        self.newAlert!.createCloseButton(tintColor: .red, imageNamed: "close-circular.png", buttonSize: 24)
        
        // set the footer button
        self.newAlert!.setFooterButton(buttonText: "Close", buttonColor: .black, buttonTextColor: .red, height: 50)
        
        /**
         * uncomment this one if want to use custom function for footer button
         */
        //self.newAlert!.handleBottomButton = handleButton
        
        // set the body view using custom body
        let newView = UIView(frame: CGRect(x: 10, y: self.newAlert!.topView!.bounds.maxY + 10, width: self.newAlert!.bounds.height - 20, height: self.newAlert!.bounds.height/3))
        newView.backgroundColor = .blue
        
        // set the body content either using bodyText -- default -- or using custom body above
        self.newAlert!.setBodyContent(bodyBackgroundColor: .magenta, bodyTextColor: .black, bodyText: "Hello This is Text Field", bodyView: newView)
        
        // show the alert with duration delay and options effect
        self.newAlert!.show(duration: 0.5, delay: 0.0, options: .curveEaseIn)
    }
    
    func handleButton(){
        print("Handle Button")
    }
}

