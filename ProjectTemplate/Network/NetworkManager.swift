//
//  NetworkManager.swift
//  ProjectTemplate
//
//  Created by NguyenVuHuy on 6/22/17.
//  Copyright © 2017 Gianty. All rights reserved.
//

import UIKit
import RxSwift
import RxAlamofire
import SwiftyJSON

/*
    * Enum of Status code response from server
    * Use to determine if request is successed or not
*/
enum StatusCode: Int {
    case Success = 200
    case TimeOut = 300
    case Failed = 400
}

/*
    * Class NetworkManager - Singleton class - Demo class - Need to implement in real project
    * Base network place for final call to api
    * Need implement for specified project
    * using RxAlamofire: https://github.com/RxSwiftCommunity/RxAlamofire
*/

class NetworkManager: NSObject {
    
    static let shared = NetworkManager()
    let disposeBag = DisposeBag()
    let header = [
        "x-appid" : "com.stixchat.app",
        "x-appversion" : "1.3.1",
        "x-build" : "1.3.1.0",
        "x-devicetype" : "IOS",
        "x-screen" : "20x",
        "x-session" : "79b8984b-2abe-4521-9b2a-62a297936dd4"
    ]
    
    let parameters = [
        "title" : "foo",
        "body": "bar",
        "userId": "1"
    ]
    
    func get(stringUrl: URL) -> Observable<Any?> {
        return  RxAlamofire.requestJSON(.get, stringUrl, parameters: parameters, headers: header)
                            .filter{ $0.0.statusCode == StatusCode.Success.rawValue}
                            .map{ JSON($0.1) }
                            .flatMapLatest{ Observable.just($0) }
    }
    
    func post(stringUrl: URL) -> Observable<Any?> {
        return RxAlamofire.requestJSON(.post, stringUrl, parameters: parameters, headers: header)
                            .filter{ $0.0.statusCode == StatusCode.Success.rawValue}
                            .flatMapLatest{ Observable.just($0.1 as! JSON) }
    }
}

extension Constants {
    static let postUrl = NSURL(string: "http://jsonplaceholder.typicode.com/posts")
    static let getUrl = NSURL(string: "https://hacker-news.firebaseio.com/v0/item/8863.json?print=pretty")
}
