//
//  ViewController.swift
//  tryFMDB
//
//  Created by AmberChin on 2017/7/20.
//  Copyright © 2017年 AmberChin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var db:FMDatabase = FMDatabase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataManager : SQLiteManager = SQLiteManager.shareIntance
        
        dataManager.createDataBase(dataName: "Translate")
        dataManager.createTable()
        dataManager.searchData()
        
//        createDataBase(dataName: "Translate")
//        createTable()
//        insertTranslate(unique: "panghu", cn: "你他妈就是在为难我胖虎", en: "Fuck")
//        insertTranslate(unique: "jiuweinan", cn: "我是胖虎爸爸", en: "Father")
//        insertTranslate(unique: "17Hi", cn: "一起嗨", en: "17Hi")
//        deleteData(unique: "jiuweinan")
//        updateData(unique: "17Hi", cn: "嗨你妹")
//        searchData()
//        searchData(unique: "jiuweinan")
    }
    
}

