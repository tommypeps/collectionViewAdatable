//
//  CollectionViewDataSource.swift
//  collectionViewAdatable
//
//  Created by José Roldán Jiménez on 11/3/18.
//  Copyright © 2018 com.roldanjimenez. All rights reserved.
//

import UIKit

class CollectionViewDataSource {
    
    let source: [CellUI] = {
        
        let menuItem1 = MenuItem(title: "title", url: "Url")
        let menuItem2 = MenuItem(title: "title2", url: "Url")
        let menuItem3 = MenuItem(title: "title3", url: "Url")
        
        let menuItem4 = MenuItem(title: "title4", url: "Url")
        
        
        let cell1 = CellUI(urlImage: "https://lorempixel.com/440/150/sports/", title: "title1", subTitle: "subTitle1", menuItem: [menuItem1, menuItem2, menuItem3, menuItem4])
        
        let cell2 = CellUI(urlImage: "https://lorempixel.com/500/250/sports/", title: "title2", subTitle: "subTitle2", menuItem: [menuItem1, menuItem2, menuItem3, menuItem4])
        
        let cell3 = CellUI(urlImage: "https://lorempixel.com/600/350/sports/", title: "title3", subTitle: "subTitle3", menuItem: [menuItem1, menuItem2, menuItem3, menuItem4])
        
        let cell4 = CellUI(urlImage: "https://lorempixel.com/600/500/sports/", title: "title4", subTitle: "subTitle4", menuItem: [menuItem1, menuItem2, menuItem3, menuItem4])
        
        let cell5 = CellUI(urlImage: "https://lorempixel.com/600/600/sports/", title: "title5", subTitle: "subTitle5", menuItem: [menuItem1, menuItem2, menuItem3, menuItem4])
        
        let cell6 = CellUI(urlImage: "https://lorempixel.com/600/500/sports/", title: "title6", subTitle: "subTitle6", menuItem: [menuItem1, menuItem2, menuItem3, menuItem4])
        
        let cell7 = CellUI(urlImage: "https://lorempixel.com/600/600/sports/", title: "title5", subTitle: "subTitle5", menuItem: [menuItem1, menuItem2, menuItem3, menuItem4])
        
        return [cell1, cell2, cell3, cell4, cell5, cell6, cell7]
        
    } ()
}
