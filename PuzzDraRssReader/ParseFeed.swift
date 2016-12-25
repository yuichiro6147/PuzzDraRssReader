//
//  ParseFeed.swift
//  PuzzDraRssReader
//
//  Created by 武田祐一郎 on 2016/11/23.
//  Copyright © 2016年 Yuichiro-Takeda. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import HTMLReader

class parseFeed{
    
    /*
     RSSのJSONをパースする
     */
    func parse (url: String, completion: @escaping (([JSON]?, NSError?) -> Void)){
        
       // var url = NSURL(string: url)
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { (response) in
                
                let json = JSON(response.data!)
                let entries = json["responseData"]["feed"]["entries"].array
                
                completion(entries, response.result.error as NSError?)
        }
    }
    
    
    /*
     URL先の文章と画像を取得
     */
    func getContents (url: String, completion: @escaping ((AnyObject, NSError?) -> Void)){
        
        //var url = NSURL(string: url)
        var ret : Dictionary<String, String?> = [:]
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            
            .responseString { (response) in
                
                var content = ""
                let html = HTMLDocument(string: response.result.value!)
                
                if let ogTags = html.nodes(matchingSelector: "meta[property=\"og:description\"]") {
                    for tag in ogTags {
                        content = (tag.attributes?["content"] as? String)!
                    }
                }
                
                var image = ""
                if let imgTags = html.nodes(matchingSelector: "img") {
                    for img in imgTags {
                        if(img.attributes?["data-src"] != nil){
                            image = (img.attributes?["data-src"] as? String)!
                        }
                    }
                }
                
                ret = [ "content": content , "image" : image ]
                completion(ret as AnyObject, response.result.error as NSError?)
        }
    }
    
}
