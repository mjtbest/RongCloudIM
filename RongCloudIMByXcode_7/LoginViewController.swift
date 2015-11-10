//
//  LoginViewController.swift
//  RongCloudIMByXcode_7
//
//  Created by mjt on 15/11/8.
//  Copyright © 2015年 mjt. All rights reserved.
//

import UIKit
/*
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = (newValue > 0)
        }
    }
}
*/

class LoginViewController: UIViewController, JSAnimatedImagesViewDataSource {

    @IBOutlet weak var loginStackView: UIStackView!
    
    @IBOutlet weak var wallPaper: JSAnimatedImagesView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.wallPaper.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(1) { () -> Void in
            self.loginStackView.axis = UILayoutConstraintAxis.Vertical
        }
    }
    
    func animatedImagesNumberOfImages(animatedImagesView: JSAnimatedImagesView!) -> UInt {
        return 5
    }
    
    func animatedImagesView(animatedImagesView: JSAnimatedImagesView!, imageAtIndex index: UInt) -> UIImage! {
        return UIImage(named: "wallPaper\(index)")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
