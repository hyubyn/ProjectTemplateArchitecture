//
//  FirstViewModel.swift
//  ProjectTemplate
//
//  Created by NguyenVuHuy on 6/22/17.
//  Copyright © 2017 Gianty. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftyJSON

class FirstViewModel {
    var rx_modelObservable = Variable<FirstModel>(FirstModel())
    var rx_loading = Variable(false)
    let disposeBag = DisposeBag()
    let firstService = FirstService()
    
    func getModel() {
        rx_loading.value = true
        FirstService.getModel().bind(onNext: { [weak self](json) in
            self?.rx_loading.value = false
            guard let jsonObject = json as? JSON else { return }
            self?.rx_modelObservable.value = FirstModel(json: jsonObject)
        }).addDisposableTo(disposeBag)
    }
}
