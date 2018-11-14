//
//  ViewController.swift
//  collectionViewAdatable
//
//  Created by José Roldán Jiménez on 9/3/18.
//  Copyright © 2018 com.roldanjimenez. All rights reserved.
//

import UIKit
let viewController = "ViewController"

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    var user = [CellUI]()
    var dataSource = CollectionViewDataSource()
    //MARK: - IBOutlet
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    //MARK: - LifeCycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: cellCollecitonView, bundle: nil), forCellWithReuseIdentifier: cellCollecitonView)
        flowLayout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
        collectionView.dataSource = self
        collectionView.delegate = self
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    override func viewWillAppear(_  animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // change 2 to desired number of seconds
            // Your code with delay
            self.flowLayout.invalidateLayout()
        }
    }

}

//MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.source.count
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellCollecitonView, for: indexPath) as? CellCollecitonView {
            collectionViewCell.cellUI = dataSource.source[indexPath.row] as CellUI
            collectionViewCell.collectionViewCellDelegate = self
            collectionViewCell.configureCell()
            return collectionViewCell
        }
        fatalError()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellCollecitonView = CellCollecitonView.getCellCollecitonView()
        cellCollecitonView.cellUI = dataSource.source[indexPath.row] as CellUI
        cellCollecitonView.configureCell()
        //fittingSizeLevel
        
        let size = cellCollecitonView.contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize,
                                                               withHorizontalFittingPriority: UILayoutPriorityFittingSizeLevel,
                                                               verticalFittingPriority: UILayoutPriorityFittingSizeLevel)
        return size
    }
    
}


extension ViewController: CollectionViewCellDelegate {
    
    func collectionViewCellHeaderPressed(collectionViewCell: UICollectionViewCell) {
        self.flowLayout.invalidateLayout()
    }
    
    func collectionViewCellHeaderPressed2(collectionViewCell: UICollectionViewCell) {
    }
}
