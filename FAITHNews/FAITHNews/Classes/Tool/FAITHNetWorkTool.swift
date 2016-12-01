//
//  FAITHNetWorkTool.swift
//  FAITHNews
//
//  Created by FAITH on 16/12/1.
//  Copyright © 2016年 FAITH. All rights reserved.
//

import UIKit
import Alamofire
//请求方法
enum MethodType {
    case get
    
    case post
}


class FAITHNetWorkTool: NSObject {

    //创建一个类方法,调用alamofire的方法,使用闭包异步回调(必须加上@escaping)
    class func requestData(urlString : String, method : MethodType,parameters : [String : Any]? = nil,finishedCallBack : @escaping(_ result : Any) ->()) {
        let type = method == .get ? HTTPMethod.get : HTTPMethod.post
        
        Alamofire.request(urlString, method: type, parameters: nil).responseJSON { (DataResponse) in
            
            guard let result = DataResponse.result.value else {
                
                print("\(DataResponse.result.error)")
                
                return
            }
            
            finishedCallBack(result)
        }
    }
}
