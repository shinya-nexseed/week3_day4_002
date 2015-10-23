//
//  ViewController.swift
//  week3_day4_002
//
//  Created by Shinya Hirai on 2015/10/22.
//  Copyright (c) 2015年 Shinya Hirai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var tableView: UITableView!
    
    var dictKeys = []
    var dictValues = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // コードで指定
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
        // json
        var path = NSBundle.mainBundle().pathForResource("members", ofType: "txt")
        
        var jsonData = NSData(contentsOfFile: path!)
        
        // 辞書データに変換
        let jsonDictionary = NSJSONSerialization.JSONObjectWithData(jsonData!, options: nil, error: nil) as! NSDictionary
        
//        for (key, value) in jsonDictionary {
//            println(key)
//            println(value)
//            println("==============")
//        }
        
        // 辞書データのキーのみすべて取得する .allKeys
        dictKeys = jsonDictionary.allKeys
        println(dictKeys[0]) // この0の部分にTableViewのindexPath.rowを使用
        
        // 辞書データの値のみすべて取得する .allValues
        dictValues = jsonDictionary.allValues
        println(dictValues[0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictKeys.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "\(dictKeys[indexPath.row])"
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // タップされたCellのindexPath.rowでdictValues配列からひとつデータを取得
        var memberInfo = dictValues[indexPath.row]
        println(memberInfo)
    }
    
}

