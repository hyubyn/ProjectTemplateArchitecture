//
//  BaseViewController.swift
//  ProjectTemplate
//
//  Created by NguyenVuHuy on 6/22/17.
//  Copyright © 2017 Gianty. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit

class BaseViewController: UIViewController {

    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    /**
       * Function's name: SetupView
       * Params: None
       * This function is to setup components, auto layout, implement in all ViewControllers
     
    **/
    func setupView() {
        
    }
    
    /**
     * Function's name: SetupRx
     * Params: None
     * This function is to setup Rx actions, implement in all ViewControllers
     
     **/
    func setupRx() {
        
    }
}
