//
//  FirstService.swift
//  ProjectTemplate
//
//  Created by NguyenVuHuy on 6/22/17.
//  Copyright © 2017 Gianty. All rights reserved.
//

import UIKit
import  RxSwift

class FirstService {
    class func getModel() -> Observable<Any?> {
        return  NetworkManager.shared.get(stringUrl: Constants.getUrl! as URL)
    }
}
