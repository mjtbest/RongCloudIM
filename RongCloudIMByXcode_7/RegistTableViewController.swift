//
//  RegistTableViewController.swift
//  RongCloudIMByXcode_7
//
//  Created by mjt on 15/11/10.
//  Copyright © 2015年 mjt. All rights reserved.
//

import UIKit

class RegistTableViewController: UITableViewController {

    @IBOutlet var requiredRegistInfo: [UITextField]!
    @IBOutlet weak var userName: UITextBox!
    @IBOutlet weak var password: UITextBox!
    @IBOutlet weak var regPwd: UITextBox!
    @IBOutlet weak var email: UITextBox!
    
    var possibleInputs : Inputs = []
    var doneButton : UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initWith()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "SubmitRegistInfo")
        doneButton = self.navigationItem.rightBarButtonItem
        doneButton?.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    
    func SubmitRegistInfo() {
        if self.checkSubRegInfoHasEmptyValue() {
            let alert = UIAlertController(title: "必填项不能为空", message: nil, preferredStyle: .Alert)
            let alertAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(alertAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func checkSubRegInfoHasEmptyValue() -> Bool {
        for textField in requiredRegistInfo {
            if (textField.text?.isEmpty == nil) {
                return true
            } else {
                return false
            }
        }
        
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        guard predicate.evaluateWithObject(email.text) else {
            self.errorNotice("邮箱格式不对!")
            return true
        }
        return true
    }
    
    func initWith() {
        let v1 = AJWValidator(type: .String)
        v1.addValidationToEnsureMinimumLength(3, invalidMessage: "用户名至少3位")
        v1.addValidationToEnsureMaximumLength(15, invalidMessage: "最大15位")
        self.userName.ajw_attachValidator(v1)
        
        v1.validatorStateChangedHandler = { (newState: AJWValidatorState) -> Void in
            switch newState {
                
            case .ValidationStateValid:
                self.userName.highlightState = .Default
                self.possibleInputs.unionInPlace(Inputs.userName)
                
            default:
                let errorMsg = v1.errorMessages.first as? String
                self.userName.highlightState = UITextBoxHighlightState.Wrong(errorMsg!)
                
                self.possibleInputs.subtractInPlace(Inputs.userName)
            }
            
            self.doneButton?.enabled = self.possibleInputs.isAllOK()
            
        }
        
        let v2 = AJWValidator(type: .String)
        v2.addValidationToEnsureMinimumLength(3, invalidMessage: "密码至少3位")
        v2.addValidationToEnsureMaximumLength(15, invalidMessage: "最长15位")
        self.password.ajw_attachValidator(v2)
        
        v2.validatorStateChangedHandler = {(newState: AJWValidatorState) -> Void in
            switch newState {
                
            case .ValidationStateValid:
                self.password.highlightState = .Default
                self.possibleInputs.unionInPlace(Inputs.password)
                
            default:
                let errorMsg = v2.errorMessages.first as? String
                self.password.highlightState = UITextBoxHighlightState.Wrong(errorMsg!)
                self.possibleInputs.subtractInPlace(Inputs.password)
            }
            self.doneButton?.enabled = self.possibleInputs.boolValue
        }
        
        let v3 = AJWValidator(type: .String)
        v3.addValidationToEnsureMinimumLength(3, invalidMessage: "密码至少3位")
        v3.addValidationToEnsureMaximumLength(15, invalidMessage: "最长15位")
//        v3.addValidationToEnsureInstanceIsTheSameAs(password.text, invalidMessage: "两次输入密码不一样")
        self.regPwd.ajw_attachValidator(v3)
        
        v3.validatorStateChangedHandler = {(newState: AJWValidatorState) -> Void in
            switch newState {
                
            case .ValidationStateValid:
                self.regPwd.highlightState = .Default
                self.possibleInputs.unionInPlace(Inputs.regPwd)
                
            default:
                let errorMsg = v3.errorMessages.first as? String
                self.regPwd.highlightState = UITextBoxHighlightState.Wrong(errorMsg!)
                self.possibleInputs.subtractInPlace(Inputs.regPwd)
            }
            self.doneButton?.enabled = self.possibleInputs.boolValue
        }
        
        let v4 = AJWValidator(type: .String)
        v4.addValidationToEnsureValidEmailWithInvalidMessage("Email格式不对")
        self.email.ajw_attachValidator(v4)
        v4.validatorStateChangedHandler = {(newState: AJWValidatorState) -> Void in
            switch newState {
                
            case .ValidationStateValid:
                self.email.highlightState = .Default
                self.possibleInputs.unionInPlace(Inputs.email)
            default:
                let errorMsg = v4.errorMessages.first as? String
                self.email.highlightState = UITextBoxHighlightState.Wrong(errorMsg!)
                self.possibleInputs.subtractInPlace(Inputs.email)
                
            }
            self.doneButton?.enabled = self.possibleInputs.boolValue
        }
    }
    
    // MARK: - Table view data source
    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    */
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
