//
//  FAITHNewsCell.swift
//  FAITHNews
//
//  Created by FAITH on 16/12/1.
//  Copyright © 2016年 FAITH. All rights reserved.
//

import UIKit
import Kingfisher

class FAITHNewsCell: UITableViewCell {

    //自定义控件
    weak var iconView : UIImageView!
    
    weak var titleLabel : UILabel!
    
    weak var sourceLabel : UILabel!
    
    weak var replyCountLabel : UILabel!
    
    //定义模型属性
    var newsModel : FAITHNewsModel? {
        didSet {

            //致命的错误: 对一个为空的optional值进行解包.
            //不能对为空的optional进行解包,否则会报运行时错误.所以在对optional进行解包之前进行判断是否为空.
//            let iconUrl : URL = URL(string: newsModel?.imgsrc ?? "")!
            
            let iconUrl = URL(string: newsModel?.imgsrc ?? "")
  
            self.iconView.kf.setImage(with: iconUrl)
            
            self.iconView.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 80.0)
            
            ///////////////////////////////////////////////////////////////////////////
            UIGraphicsBeginImageContext(iconView.bounds.size)
            
            let bezierPath = UIBezierPath(roundedRect: iconView.bounds, cornerRadius: 20.0)
            
            bezierPath.addClip()
            
            iconView.image?.draw(in: iconView.bounds)
            
            let newIconImage = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndPDFContext()
            ////////////////////////////////////////////////////////////////////////////
            
            self.iconView.image = newIconImage
            
            self.iconView.layoutIfNeeded()
            
            self.titleLabel.text = newsModel?.title
            
            self.titleLabel.frame = CGRect(x: 110.0, y: 0.0, width: self.contentView.bounds.size.width-50, height: 60.0)
            
            self.sourceLabel.text = newsModel?.source
            
            self.sourceLabel.frame = CGRect(x: self.titleLabel.frame.origin.x, y: 60.0, width: 100.0, height: 20.0)
            
            self.replyCountLabel.text = String("\((newsModel?.replyCount)!)跟帖")
            
            self.replyCountLabel.frame = CGRect(x: 300.0, y: 55.0, width: 60.0, height: 20.0)
            
            self.setNeedsLayout()
        }
        
    }

    //重写构造方法添加设置自定义控件
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpSubViews()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpSubViews() {
        
        let iconView = UIImageView()
        
        self.iconView = iconView
        
        self.contentView.addSubview(iconView)
        
        let titleLabel = UILabel()
        
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        
        titleLabel.numberOfLines = 0

        self.contentView.addSubview(titleLabel)
        
        self.titleLabel = titleLabel
        
        let sourceLabel  = UILabel()
        
        sourceLabel.font = UIFont.systemFont(ofSize: 10)
        
        sourceLabel.textColor = UIColor.lightGray
        
        self.contentView.addSubview(sourceLabel)
        
        self.sourceLabel = sourceLabel
        
        let replyCountLabel = UILabel()
        
        replyCountLabel.backgroundColor = UIColor(colorLiteralRed: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
        
        replyCountLabel.font = UIFont.systemFont(ofSize: 10)
        
        replyCountLabel.layer.cornerRadius = 5
        
        replyCountLabel.layer.masksToBounds = true
        
        replyCountLabel.textAlignment = .center
        
        self.contentView.addSubview(replyCountLabel)
        
        self.replyCountLabel = replyCountLabel
        
        
    }

}
