//
//  ConversationListViewController.swift
//  RongCloudIMByXcode_7
//
//  Created by mjt on 15/11/8.
//  Copyright © 2015年 mjt. All rights reserved.
//

import UIKit

class ConversationListViewController: RCConversationListViewController {

    let appDelegate = AppDelegate()
    let conversationVC = RCConversationViewController()
    
    @IBAction func ShowMenu(sender: UIBarButtonItem) {
        self.setKxMenu(sender)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        appDelegate.connectServer { () -> Void in
            print("connect success!")
            self.setDisplayConversationTypes([
                RCConversationType.ConversationType_PRIVATE.rawValue])
            // 跟新tableview显示数据
            self.refreshConversationTableViewIfNeeded()
        }
    }
    
    func setKxMenu(sender: UIBarButtonItem) {
        var menuFrame = sender.valueForKey("view")!.frame
        menuFrame.origin.y = menuFrame.origin.y + CGFloat(30)
        let menuItemsList = [
            KxMenuItem("添    加",image:nil,target:self,action:"ClickedAddButton"),
            KxMenuItem("摇一摇",image:nil,target:self,action:""),
            KxMenuItem("扫一扫",image:nil,target:self,action:"")
        ]
        KxMenu.showMenuInView(self.view, fromRect: menuFrame, menuItems: menuItemsList)
    }
    
    func ClickedAddButton() {
        self.setPopMenu()
    }
    
    func setPopMenu() {
        let menuItemsList = [
            MenuItem(title: "添加好友", iconName: "Friends", glowColor: UIColor.redColor(), index: 0),
            MenuItem(title: "添加群组", iconName: "Group", glowColor: UIColor.redColor(), index: 1),
            MenuItem(title: "添加公众号", iconName: "Office", glowColor: UIColor.redColor(), index: 2)
        ]
        let popMenu = PopMenu(frame: self.view.bounds, items: menuItemsList)
        popMenu.menuAnimationType = .NetEase
        if popMenu.isShowed {
            return
        }
        popMenu.didSelectedItemCompletion = {(selectedItem: MenuItem!) -> Void in
print(selectedItem.index)
        }
        popMenu.showMenuAtView(self.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func onSelectedTableRow(conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, atIndexPath indexPath: NSIndexPath!) {
        // 获取当前选中的属性值
        conversationVC.targetId = model.targetId
        conversationVC.userName = model.conversationTitle
        conversationVC.title = model.conversationTitle
        conversationVC.conversationType = RCConversationType.ConversationType_PRIVATE
        // 手动转场 
        /*
        self.navigationController?.pushViewController(conversationVC, animated: true)
        self.tabBarController!.tabBar.hidden = true
        */
        // 使用storyboard转场
        self.performSegueWithIdentifier("performToConversationView", sender: self)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.tabBarController!.tabBar.hidden = true
        // 在转场前设置目标控制器的相关属性
        let destinationVC = segue.destinationViewController as? RCConversationViewController
        destinationVC!.targetId = self.conversationVC.targetId
        destinationVC!.userName = self.conversationVC.userName
        destinationVC!.title = self.conversationVC.title
        destinationVC!.conversationType = self.conversationVC.conversationType
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController!.tabBar.hidden = false
        self.refreshConversationTableViewIfNeeded()
    }
    
}
