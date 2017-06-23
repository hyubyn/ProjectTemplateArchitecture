//
//  StringExtension.swift
//  ProjectTemplate
//
//  Created by NguyenVuHuy on 6/22/17.
//  Copyright © 2017 Gianty. All rights reserved.
//

import Foundation

extension String {
    
    /**
     * Function's name: localizedString
     * Params: None
     * This function is to localize string for multi language
     **/
    func localizedString() -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
