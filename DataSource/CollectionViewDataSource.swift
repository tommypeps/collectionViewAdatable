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

        let cell1 = CellUI(urlImage: "https://lorempixel.com/300/10/sports/", title: "title1", subTitle: "subTitle1", menuItem: [menuItem1, menuItem2, menuItem3, menuItem4])
        
        let cell2 = CellUI(urlImage: "https://lorempixel.com/300/20/sports/", title: "title2", subTitle: "subTitle2", menuItem: [menuItem1, menuItem2, menuItem3, menuItem4])
        
        let cell3 = CellUI(urlImage: "https://lorempixel.com/300/30/sports/", title: "title3", subTitle: "subTitle3", menuItem: [menuItem1, menuItem2, menuItem3, menuItem4])
        
        let cell4 = CellUI(urlImage: "https://lorempixel.com/300/50/sports/", title: "title4", subTitle: "subTitle4", menuItem: [menuItem1, menuItem2, menuItem3, menuItem4])
        
        let cell5 = CellUI(urlImage: "https://lorempixel.com/300/80/sports/", title: "title5", subTitle: "subTitle5", menuItem: [menuItem1, menuItem2, menuItem3, menuItem4])
        
        let cell6 = CellUI(urlImage: "https://lorempixel.com/300/100/sports/", title: "title6", subTitle: "subTitle6", menuItem: [menuItem1, menuItem2, menuItem3, menuItem4])
        
        let cell7 = CellUI(urlImage: "https://lorempixel.com/300/120/sports/", title: "title7", subTitle: "subTitle7", menuItem: [menuItem1, menuItem2, menuItem3, menuItem4])
        
        let cell8 = CellUI(urlImage: "https://lorempixel.com/300/200/sports/", title: "title8", subTitle: "subTitle8", menuItem: [menuItem1, menuItem2, menuItem3, menuItem4])
        
        let cell9 = CellUI(urlImage: "https://lorempixel.com/300/600/sports/", title: "title9", subTitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi enim turpis, congue vel faucibus eget, egestas at odio. Morbi tempus quam tempor dolor consequat lacinia. Curabitur interdum accumsan bibendum. Morbi convallis eleifend erat, a dictum enim euismod at. Sed vitae purus magna. Nam lorem nisi", menuItem: [menuItem1, menuItem2, menuItem3, menuItem4])
        
        
        return [cell1, cell2, cell3, cell4, cell5, cell6, cell7,cell8, cell9]
        
    } ()
}
