//
//  ViewController.swift
//  swiftQuartz2D
//
//  Created by LoveQiuYi on 16/1/20.
//  Copyright © 2016年 LoveQiuYi. All rights reserved.
//

import UIKit
let width = UIScreen .mainScreen().bounds.size.width
let height = UIScreen.mainScreen().bounds.size.height
let myActivityIndicatorView = UIActivityIndicatorView()
let data = NSArray(objects: "A","B","C","D","E")
var str:[String] = ["a","b","c","d","e"]

class myView: UIView {
    override func drawRect(rect: CGRect) {
        //创建一个上下文
        let context = UIGraphicsGetCurrentContext()
        //绘制线条
        CGContextMoveToPoint(context, 100, 100)
        CGContextAddLineToPoint(context, 300, 100)
        CGContextStrokePath(context)
        //绘制矩形
        CGContextAddRect(context, CGRectMake(100, 120, 200, 100))
//        CGContextAddRects(context, rects: UnsafePointer<CGRect>, 3)
        //设置线条的颜色
        CGContextSetStrokeColorWithColor(context, UIColor.whiteColor().CGColor)
        //设置线条的宽度
        CGContextSetLineWidth(context, 2.0)
        CGContextStrokePath(context)
        //绘制圆形，四个参数分别是圆心的坐标以及圆的长轴和短轴
        CGContextAddEllipseInRect(context, CGRectMake(10, 50, 100, 50))
        CGContextStrokePath(context)
        CGContextAddArc(context, 50, 50, 30, 30, -30, 0)
        CGContextStrokePath(context)
    }
}

class ViewController: UIViewController,UIWebViewDelegate,UITableViewDataSource,UITableViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
       // let myContextView = myView()//创建这个类的对象
//        myContextView.frame = CGRectMake(10, 20, width-20, height/2-40)
//        myContextView.backgroundColor = UIColor.brownColor()
//        //这个对象添加到view中
//        self.view.addSubview(myContextView)
        
       //创建表格
        let tableView = UITableView(frame: self.view.bounds)
        self.view = tableView
//        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.editing = true
        
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        cell.textLabel!.text = "\(data.objectAtIndex(indexPath.row))"
        return cell
    }
    //页眉
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "zhangxin"
    }
    //页脚
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "zhangxinxin"
    }
    //添加索引
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return str
    }
    //webView的数据源方法
    func webViewDidStartLoad(webView: UIWebView) {
        myActivityIndicatorView.startAnimating()
        myActivityIndicatorView.hidden = false
       // print("asdwq")
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        myActivityIndicatorView.stopAnimating()
        myActivityIndicatorView.hidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
func web(){
    let webView = UIWebView(frame: CGRectMake(10, height/2-20, width - 20, height/2 + 40))
    //创建url
    let url = NSURL(string: "http://www.baidu.com")
    //创建Request对象
    let request = NSURLRequest(URL: url!)
    //加载Request
    webView.loadRequest(request)
    //网页的内容自动缩放
    webView.scalesPageToFit = true
//    self.view.addSubview(webView)
//    webView.delegate = self
    webView.userInteractionEnabled = true
    myActivityIndicatorView.hidden = true
}
