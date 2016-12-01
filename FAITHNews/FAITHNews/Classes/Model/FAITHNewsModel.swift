//
//  FAITHNewsModel.swift
//  FAITHNews
//
//  Created by FAITH on 16/12/1.
//  Copyright © 2016年 FAITH. All rights reserved.
//

import UIKit

//使用KVC字典转模型,必须继承自nsobject
class FAITHNewsModel: NSObject {
    //定义属性
    var imgsrc : String = ""
    
    var title : String = ""
    
    var source : String = ""
    
    var replyCount : Int = 0
    
    //字典转模型
    init(dict : [String : Any?]) {
        //县调用super的方法
        super.init()
        
        setValuesForKeys(dict)
    }
    
    //重写抛异常方法
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    
    
    

}
