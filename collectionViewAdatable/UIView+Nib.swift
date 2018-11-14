//
//  UIView+Nib.swift
//  collectionViewAdatable
//
//  Created by JOSE ROLDAN JIMENEZ on 12/11/2018.
//  Copyright © 2018 com.roldanjimenez. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    class func loadFromNibNamed(nibNamed: String, bundle: Bundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
}
