//
//  ViewController.swift
//  FAITHNews
//
//  Created by FAITH on 16/12/1.
//  Copyright © 2016年 FAITH. All rights reserved.
//

import UIKit


private let kNewsCellID = "newsCell"
class ViewController: UITableViewController {

    //懒加载属性
    fileprivate lazy var newsModels : [FAITHNewsModel] = [FAITHNewsModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //设置导航控制器
        setUpNavigationBar()
        
        self.tableView.rowHeight = 80.0
        
        loadData()
    }
}

//设置导航控制器
extension ViewController {
    fileprivate func setUpNavigationBar() {
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named : "reader_navigation_background"), for: .default)
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "navigation_logo"))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named : "navigation_search"), style: .plain, target: self, action: #selector(searchBtnClick))
        
    }
    
}

//监听事件的点击
extension ViewController {
    //事件点击需要加上@objc
    @objc fileprivate func searchBtnClick() {
        print("searchBtnClick被点击了")
    }
}

//发送网络请求,返回shuju
extension ViewController {
    fileprivate func loadData() {
    
        FAITHNetWorkTool.requestData(urlString : "http://c.m.163.com/nc/article/list/T1348649079062/0-20.html", method : .get) { (result : Any) in
            
            //将any类型转换成字典类型
            guard let dictResult = result as? [String : Any] else { return }
            //转换成字典数组
            guard let dictArray = dictResult["T1348649079062"] as? [[String : Any]] else { return }
            
            //遍历字典数组,转换城模型,加入数组
            for dict in dictArray {
                
                self.newsModels.append(FAITHNewsModel(dict: dict))
                
            }
            
            self.tableView.reloadData()
        }
    }
}

//UITableView数据源方法
extension ViewController {
    
    //返回多少行
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsModels.count
    }
    
    //每行显示什么内容
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FAITHNewsCell(style: .default, reuseIdentifier: kNewsCellID)
        
        cell.newsModel = self.newsModels[indexPath.row]
        
        return cell
    }
}














