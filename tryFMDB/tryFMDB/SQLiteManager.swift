//
//  SQLiteManager.swift
//  tryFMDB
//
//  Created by AmberChin on 2017/7/20.
//  Copyright © 2017年 AmberChin. All rights reserved.
//

import UIKit

class SQLiteManager: NSObject {
    
    static let shareIntance: SQLiteManager = SQLiteManager()
    
    var db:FMDatabase = FMDatabase()
    
    var arrOfTraslate = [Translate]()
    
    //    MARK:- 创建数据库 和 表
    func createDataBase(dataName:String) {
        
        let path:String = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
        
        let finalPath:String = path.appending("/\(dataName).sqlite")
        
        print("数据存储地址:\(finalPath)")
        
        db = FMDatabase(path: finalPath)
        
        if db.open() {
            print("数据库打开成功")
        }
    }
    
    func createTable()  {
        let createTableSQL = "CREATE TABLE IF NOT EXISTS 't_translate' ('id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,'uniqueText' TEXT,'cn' TEXT,'en' TEXT);"
        
        let result = db.executeUpdate(createTableSQL, withArgumentsIn: [])
        
        if result {
            print("创建表格成功")
        }
    }
    
    //    MARK:- 增
    func insertTranslate(unique : String , cn : String , en : String) {
        let insertSQL = "INSERT INTO t_translate (uniqueText, cn, en) VALUES (\"\(unique)\",\"\(cn)\", \"\(en)\");"
        
        let result = db.executeUpdate(insertSQL, withArgumentsIn: [])
        
        if result {
            print("数据新增成功")
        }
    }
    
    //    MARK:- 删
    func deleteData(unique : String) {
        let deleteSQL = "DELETE FROM t_translate where uniqueText = \"\(unique)\" "
        
        let result = db.executeUpdate(deleteSQL, withArgumentsIn: [])
        
        if result {
            print("数据删除成功")
        }
    }
    
    func deleteData() {
        let deleteSQL = "DELETE FROM t_translate WHERE id = 1"
        
        let result = db.executeUpdate(deleteSQL, withArgumentsIn: [])
        
        if result {
            print("数据删除成功")
        }
    }
    
    //    MARK:- 改
    func updateData(unique : String ,  cn : String) {
        let updateSQL = "UPDATE t_translate SET cn = \"\(cn)\" WHERE uniqueText = \"\(unique)\""
        
        let result = db.executeUpdate(updateSQL, withArgumentsIn: [])
        
        if result {
            print("修改成功")
        }
    }
    
    func updateData(unique : String ,  en : String) {
        let updateSQL = "UPDATE t_order SET en = \"\(en)\" WHERE uniqueText = \"\(unique)\""
        
        let result = db.executeUpdate(updateSQL, withArgumentsIn: [])
        
        if result {
            print("修改成功")
        }
    }
    
    //    MARK:- 查
    func searchData() {
        let querySQL = "SELECT * FROM t_translate"
        
        var resultSet:FMResultSet?
        self.arrOfTraslate.removeAll()
        do {
            try resultSet =  db.executeQuery(querySQL, values: nil)
            let translateData = Translate()
            
            while (resultSet?.next())! {
                let uniqueText = resultSet?.string(forColumn: "uniqueText")
                let cn = resultSet?.string(forColumn: "cn")
                let en = resultSet?.string(forColumn: "en")
                print("uniqueText:\(uniqueText!)--cn:\(cn!)--en:\(en!)")
                
                translateData.sEn = en!
                translateData.sCn = cn!
                translateData.sUniqueText = uniqueText!
                self.arrOfTraslate.append(translateData)
            }
        } catch {
            
        }
        print(self.arrOfTraslate[0].sCn)
    }
    
    //    MARK:- 查找特定条件
    func searchData(unique : String) {
        let querySQL = "SELECT * FROM t_translate where uniqueText = \"\(unique)\" "
        
        var resultSet:FMResultSet?
        
        do {
            try resultSet =  db.executeQuery(querySQL, values: nil)
            
            while (resultSet?.next())! {
                let uniqueText = resultSet?.string(forColumn: "uniqueText")
                let cn = resultSet?.string(forColumn: "cn")
                let en = resultSet?.string(forColumn: "en")
                print("uniqueText:\(uniqueText!)--cn:\(cn!)--en:\(en!)")
            }
        } catch {
            
        }
        
    }
 
    
}




