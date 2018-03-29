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
    var contentOffset = CGPoint()
    var indexPath = IndexPath()
    
    //MARK: - IBOutlet
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var collectionFlow: UICollectionViewFlowLayout!
    
    //MARK: - LifeCycle
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionFlow.invalidateLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: cellCollecitonView, bundle: nil), forCellWithReuseIdentifier: cellCollecitonView)
        
        collectionFlow.estimatedItemSize = CGSize(width: 1, height: 1)
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.dataSource = self
        self.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            self.collectionFlow.invalidateLayout()
        }
        
 
 
    }
}

//MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.source.count
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("cellForItemAt" + String(indexPath.row))
        if let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellCollecitonView, for: indexPath) as? CellCollecitonView {
            collectionViewCell.cellUI = dataSource.source[indexPath.row] as CellUI
            collectionViewCell.collectionViewCellDelegate = self
            collectionViewCell.configureCell()
            return collectionViewCell
        }
        fatalError()
    }
}

extension ViewController: CollectionViewCellDelegate {
    
    func collectionViewCellHeaderPressed(collectionViewCell: UICollectionViewCell) {
        
        self.contentOffset = self.collectionView.contentOffset // currentContentOffset
        self.indexPath = self.collectionView.indexPath(for: collectionViewCell)!
        
        UIView.performWithoutAnimation {
            self.collectionView.reloadSections(IndexSet(integer: self.indexPath.section))
            self.collectionView.setContentOffset(self.contentOffset, animated: false)
        }
        UIView.performWithoutAnimation {
            self.collectionView.reloadSections(IndexSet(integer: self.indexPath.section))
            self.collectionView.setContentOffset(self.contentOffset, animated: false)
        }
        
        UIView.performWithoutAnimation {
            self.collectionView.reloadSections(IndexSet(integer: self.indexPath.section))
            self.collectionView.setContentOffset(self.contentOffset, animated: false)
        }
        
        
        
        /*
         UIView.performWithoutAnimation {
            self.collectionView.performBatchUpdates({
                self.collectionView.reloadItems(at: [self.indexPath])
         }, completion: nil)
         }
         */

        
        /*
        // Permite recargar la cell y luego acer le scroll top item
        UIView.setAnimationsEnabled(false)
        self.collectionView.performBatchUpdates({
            DispatchQueue.main.async {
                let indexSet = IndexSet(integer: 0)
                self.collectionView.reloadSections(indexSet)
            }
            
        }) { (succes: Bool) in
            print("End")
            UIView.setAnimationsEnabled(true)
            
            self.collectionView.scrollToItem(at: self.indexPath, at: UICollectionViewScrollPosition.top, animated: false)
            
            if let cell = self.collectionView.cellForItem(at: self.indexPath) as? CellCollecitonView {
                print("cell form collectionView")
                print(cell.cellUI!)
                var offset = CGFloat(0)
                offset = cell.headerImage.bounds.height / 2
                if !(cell.cellUI?.tableViewCollapse)! {
                    self.collectionView.setContentOffset(CGPoint(x: 0,
                                                                 y: cell.frame.origin.y + offset),
                                                         animated: true)
                } else {
                    self.collectionView.setContentOffset(CGPoint(x: 0, y: cell.frame.origin.y ), animated: true)
                }
            }
        }
        
        */
        /*
        //Reload le cell on
        UIView.performWithoutAnimation {
            self.collectionView.reloadItems(at: [self.indexPath])
        }
        
        UIView.performWithoutAnimation {
            self.collectionView.reloadItems(at: [self.indexPath])
        }
        */
        /*
        UIView.animate(withDuration: 0.3, animations: {
            self.collectionView.performBatchUpdates({
                self.collectionView.reloadItems(at: [self.indexPath])
            }, completion: nil)
        })
         */
        /*
        var offset = CGFloat(0)
        if let cell = self.collectionView.cellForItem(at: self.indexPath) as? CellCollecitonView {
            offset = cell.headerImage.bounds.height / 2
            if !(cell.cellUI?.tableViewCollapse)! {
                self.collectionView.setContentOffset(CGPoint(x: 0,
                                                             y: cell.frame.origin.y + offset),
                                                     animated: true)
            } else {
                self.collectionView.setContentOffset(CGPoint(x: 0, y: cell.frame.origin.y ), animated: true)
            }
        }
        */
        
    }
    
    func collectionViewCellHeaderPressed2(collectionViewCell: UICollectionViewCell) {
        
        self.contentOffset = self.collectionView.contentOffset // currentContentOffset
        self.indexPath = self.collectionView.indexPath(for: collectionViewCell)!
        if let cellCollecitonView = collectionViewCell as? CellCollecitonView {
            print("beforeinvalidate")
            print(cellCollecitonView.cellUI!)
            print("IndexPath: " + String(self.indexPath.row))
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.001) {
            self.collectionFlow.invalidateLayout()
            
            //self.collectionView.setContentOffset(self.contentOffset, animated: false)
            
            //DispatchQueue.main.async {
            self.collectionView.setContentOffset(self.contentOffset, animated: false)
            
            //DispatchQueue.main.async {
            //DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.0000001) {
            self.collectionView.setContentOffset(self.contentOffset, animated: false)
            //self.collectionFlow.invalidateLayout()
            
            DispatchQueue.main.async {
                if let cell = self.collectionView.cellForItem(at: self.indexPath) as? CellCollecitonView {
                    print("cell form collectionView")
                    print(cell.cellUI!)
                    var offset = CGFloat(0)
                    offset = cell.headerImage.bounds.height / 2
                    if !(cell.cellUI?.tableViewCollapse)! {
                        self.collectionView.setContentOffset(CGPoint(x: 0,
                                                                     y: cell.frame.origin.y + offset),
                                                             animated: true)
                    } else {
                        self.collectionView.setContentOffset(CGPoint(x: 0, y: cell.frame.origin.y ), animated: true)
                    }
                    
                    
                }
                
                
                
                if let cellCollecitonView = collectionViewCell as? CellCollecitonView {
                    print("after Invalidate")
                    print(cellCollecitonView.cellUI!)
                    print("IndexPath: " + String(self.indexPath.row))
                }
            }
            //}
            //}
            
            
            
            
            print("setContentOffsetEnd")
            //Force main thread
            
            
        }
    }
}
