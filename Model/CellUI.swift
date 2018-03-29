//
//  collectionViewAdatable.swift
//  collectionViewAdatable
//
//  Created by José Roldán Jiménez on 9/3/18.
//  Copyright © 2018 com.roldanjimenez. All rights reserved.
//

import UIKit


class CellUI {
    
    var urlImage: String
    var title: String
    var subTitle: String
    var menuItem = [MenuItem]()
    var tableViewCollapse = true
    
    init(urlImage: String, title: String, subTitle: String, menuItem: [MenuItem]) {
        self.urlImage = urlImage
        self.title = title
        self.subTitle = subTitle
        self.menuItem = menuItem
    }
}

class MenuItem {
    
    let title: String?
    let url: String?
    
    init(title:String, url: String) {
        self.title = title
        self.url = url
    }
}
