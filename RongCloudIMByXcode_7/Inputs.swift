//
//  Inputs.swift
//  IMtest
//
//  Created by xiaobo on 15/8/15.
//  Copyright © 2015年 xiaobo. All rights reserved.
//

import Foundation


struct Inputs: OptionSetType {
    let rawValue: Int
    
    static let userName = Inputs(rawValue: 1)  //1
    static let password = Inputs(rawValue: 1 << 1) //10
    static let regPwd = Inputs(rawValue: 1 << 2) //100
    static let email = Inputs(rawValue: 1 << 3) //1000
    
}


extension Inputs: BooleanType {
    var boolValue: Bool {
        return self.rawValue == 0b1111
    }
}

//判断是否全部输入
extension Inputs {
    func isAllOK() -> Bool {
        //        return self == [.user, .pass, .mail]
        //        return self.rawValue == 0b111
        
        //选项的数目
        let count = 4
        
        //找到几项
        var found = 0
        
        //在数目范围内查找,若找到, 次数增加
        for time in 0..<count where contains(Inputs(rawValue: 1 << time)) {
            found++
        }
        
        //比较次数与选项的数目
        return found == count
        
    }
}


