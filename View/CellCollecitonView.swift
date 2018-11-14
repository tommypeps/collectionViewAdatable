//
//  CellCollecitonView.swift
//  collectionViewAdatable
//
//  Created by José Roldán Jiménez on 9/3/18.
//  Copyright © 2018 com.roldanjimenez. All rights reserved.
//

import UIKit
import SDWebImage

let cellCollecitonView = "CellCollecitonView"
let menuTableViewCell = "menuTableViewCell"

protocol CollectionViewCellDelegate {
    func collectionViewCellHeaderPressed(collectionViewCell: UICollectionViewCell)
}

class CellCollecitonView: UICollectionViewCell {
    
    static func getCellCollecitonView() -> CellCollecitonView {
        guard let cellCollecitonView = UIView.loadFromNibNamed(nibNamed: "CellCollecitonView") as? CellCollecitonView else {
            fatalError()
        }
        return cellCollecitonView
    }
    
    
    var cellUI: CellUI?
    
    var collectionViewCellDelegate: CollectionViewCellDelegate?
    
    @IBOutlet var headerImage: UIImageView!

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bodyLabel: UILabel!
    @IBOutlet var menuTableView: UITableView!
    
    @IBOutlet var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var CellCollectionViewWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWitdh = UIScreen.main.bounds.size.width
        CellCollectionViewWidth.constant = screenWitdh
    }
    
    override func prepareForReuse() {
        cellUI = nil
        collectionViewCellDelegate = nil
        titleLabel.text = ""
        bodyLabel.text = ""
        menuTableView.dataSource = nil
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        let screenWitdh = UIScreen.main.bounds.size.width
        CellCollectionViewWidth.constant = screenWitdh
    }
    
    func configureCell() {
        
        guard let cellUI = cellUI else {
            fatalError("Configure CellCollecitonView")
        }
        if let urlImagge = URL(string: cellUI.urlImage) {
            headerImage.sd_setImage(with: urlImagge) { (image, error, cacheType, url) in
                

            }
        }
        
        titleLabel.text = cellUI.title
        bodyLabel.text = cellUI.subTitle
        menuTableView.dataSource = self
        tableViewHeightConstraint.constant = cellUI.tableViewCollapse ? CGFloat(0) : CGFloat(44 * cellUI.menuItem.count)
    }
    
    
    @IBAction func imagePressed(_ sender: Any) {
        toggleCell()
    }
    
    func  toggleCell()  {
        guard let cellUI = cellUI else {
            fatalError("Configure CellCollecitonView")
        }
        cellUI.tableViewCollapse = !cellUI.tableViewCollapse
        tableViewHeightConstraint.constant = cellUI.tableViewCollapse ? CGFloat(0) : CGFloat(44 * cellUI.menuItem.count)
        collectionViewCellDelegate?.collectionViewCellHeaderPressed(collectionViewCell: self)
    }
}

extension CellCollecitonView: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
        return cellUI?.menuItem.count ?? 0
    }
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let menuItem = cellUI?.menuItem[indexPath.row] else {
            fatalError(cellCollecitonView + "menuItem")
        }
        let tableviewCell = UITableViewCell(style: .default, reuseIdentifier: menuTableViewCell)
        
        tableviewCell.textLabel?.text = menuItem.title
        return tableviewCell
    }
}
