//
//  ViewController.swift
//  ProjectTemplate
//
//  Created by NguyenVuHuy on 6/22/17.
//  Copyright © 2017 Gianty. All rights reserved.
//
import UIKit
import RxCocoa
import RxSwift

class DemoViewController: BaseViewController {

    let firstText = "Click the button!".localizedString()
    let secondText = "Button has been clicked!".localizedString()
    let firstViewModel = FirstViewModel()
    
    
    lazy var testButton: UIButton = {
        let button = UIButton()
        button.setTitle("Click me!".localizedString(), for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.setTitleColor(UIColor.white, for: .highlighted)
        button.backgroundColor = UIColor.blue
        button.sizeToFit()
        return button
    }()
    
    lazy var testLabel: UILabel = {
        let label = UILabel()
        label.text = self.firstText
        label.textAlignment = .center
        label.backgroundColor = UIColor.green
        label.textColor = UIColor.white
        label.numberOfLines = 0
        return label
    }()
    
    lazy var loadingIndicator: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        return loading
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupRx()
    }
    
    override func setupView() {
        view.addSubview(testButton)
        view.addSubview(testLabel)
        view.addSubview(loadingIndicator)
        
        testButton.snp.makeConstraints { (maker) in
            maker.center.equalTo(view)
            maker.height.equalTo(testButton.snp.width)
        }
        testButton.addCircle()
        testButton.addShadow()
        
        testLabel.snp.makeConstraints { (maker) in
            maker.leading.trailing.equalTo(0).inset(20)
            maker.bottom.equalTo(testButton.snp.top).inset(-20)
        }
        testLabel.addCornerRadius(radius: 10)
        
        loadingIndicator.snp.makeConstraints { (maker) in
            maker.center.equalTo(view)
        }
        
    }
    
    override func setupRx() {
        // action when press button
        testButton
            .rx
            .tap
            .debounce(0.3, scheduler: MainScheduler.instance)
            .bind (onNext: { [unowned self] _ in
                self.firstViewModel.getModel()
            })
            .addDisposableTo(disposeBag)
        
        // observed model to update view
        
        firstViewModel.rx_modelObservable.asObservable()
            .filter{ $0.by != "" }
            .subscribe( onNext: { [unowned self] (model) in
            self.testLabel.text = "This model has the value by: \(model.by)"
        }).addDisposableTo(disposeBag)
        
        firstViewModel
            .rx_loading
            .asObservable().bind(to: loadingIndicator.rx.isAnimating)
            .addDisposableTo(disposeBag)
    }

}

