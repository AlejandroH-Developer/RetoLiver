//
//  PLPViewController.swift
//  RetoLiver
//
//  Created by AlejandroH on 18/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import UIKit

class PLPViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var deploySearchButton: UIButton!
    @IBOutlet weak var collectioView: UICollectionView!
   
}


// MARK: - Controller methods

extension PLPViewController {
    
    override func viewDidLoad() {
           super.viewDidLoad()
    }
       
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
}


// MARK: - Methods

extension PLPViewController {
    
    func goToSearch() {
        let controller: SearchViewController = SearchViewController.instanceFromStoryboard() as! SearchViewController
        self.presentViewController(controller, animated: true)
    }
    
}


// MARK: - Actions

extension PLPViewController {
    
    @IBAction private func didPressSearch(_ sender: UIButton) {
        goToSearch()
    }
    
}


// MARK: - CollectionView methods

extension PLPViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    // Datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item: ProductCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        return item
    }
    
    // Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.bounds.size.width / 2)
        let height: CGFloat = 1.4 * width
        return CGSize(width: width, height: height)
    }
    
    
    // Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
}
