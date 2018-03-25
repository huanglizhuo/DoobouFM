//
//  File.swift
//  DouBanFM
//
//  Created by lizhuo on 3/20/18.
//  Copyright © 2018 lizhuo. All rights reserved.
//

import Foundation
import Alamofire

enum MethodType {
    case get
    case post
}
let channelURL="https://api.douban.com/v2/fm/app_channels?alt=json&apikey=02646d3fb69a52ff072d47bf23cef8fd&app_name=radio_iphone&client=s%3Amobile%7Cy%3AiOS%2010.2%7Cf%3A115%7Cd%3Ab88146214e19b8a8244c9bc0e2789da68955234d%7Ce%3AiPhone7%2C1%7Cm%3Aappstore&douban_udid=b635779c65b816b13b330b68921c0f8edc049590&icon_cate=xlarge&udid=b88146214e19b8a8244c9bc0e2789da68955234d&version=115"
let palyListURL="https://api.douban.com/v2/fm/playlist?alt=json&apikey=02646d3fb69a52ff072d47bf23cef8fd&app_name=radio_iphone&client=s%3Amobile%7Cy%3AiOS%2010.2%7Cf%3A115%7Cd%3Ab88146214e19b8a8244c9bc0e2789da68955234d%7Ce%3AiPhone7%2C1%7Cm%3Aappstore&douban_udid=b635779c65b816b13b330b68921c0f8edc049590&formats=aac&kbps=128&pt=0.0&type=n&udid=b88146214e19b8a8244c9bc0e2789da68955234d&version=115"
class DouBan {
    class func requestData(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        // 1.获取类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        // 2.发送网络请求
        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            
            // 3.获取结果
            guard let result = response.data else {
                print(response.result.error!)
                return
            }
            // 4.将结果回调出去
            finishedCallback(result)
        }
    }
    class func reqChannels(finishedCallback :  @escaping (_ channels : Channels_Base) -> ()) {
        DouBan.requestData(.get, URLString: channelURL){ (result) in
            do{
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(Channels_Base.self, from: result as! Data)
                finishedCallback(responseModel)
            }catch{
                print(error)
                return
            }
        }
        
    }
    class func reqPlaylist(channel : String,finishedCallback :  @escaping (_ channels : Playlist_Base) -> ()) {
        requestData(.get, URLString: palyListURL+"&channel="+channel) { (_ result) in
            do{
                print(result)
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(Playlist_Base.self, from: result as! Data)
                finishedCallback(responseModel)
            }catch{
                print(error)
                return
            }
        }
    }
}
