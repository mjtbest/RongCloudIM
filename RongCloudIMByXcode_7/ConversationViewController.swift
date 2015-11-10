//
//  ConversationViewController.swift
//  RongCloudIMByXcode_7
//
//  Created by mjt on 15/11/8.
//  Copyright © 2015年 mjt. All rights reserved.
//

import UIKit

class ConversationViewController: RCConversationViewController, RCIMUserInfoDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setRCIMClientInfo()
        RCIM.sharedRCIM().userInfoDataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setRCIMClientInfo() {
        // 设置聊天接收对象信息
        let currentUserInfo = RCIMClient.sharedRCIMClient().currentUserInfo
        self.targetId = currentUserInfo?.userId
        self.userName = currentUserInfo?.name
        self.conversationType = .ConversationType_PRIVATE
        self.title = self.userName
        // 设置聊天头像为圆形
        self.setMessageAvatarStyle(.USER_AVATAR_CYCLE)
    }
    
    // 设置用户头像
    func getUserInfoWithUserId(userId: String!, completion: ((RCUserInfo!) -> Void)!) {
        let userInfo = RCUserInfo()
        userInfo.userId = userId
        switch userId {
        case "123":
            userInfo.name = "涛哥"
            userInfo.portraitUri = "http://img2.imgtn.bdimg.com/it/u=3359865473,1570945789&fm=21&gp=0.jpg"
        default: break
        }
        return completion(userInfo)
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
