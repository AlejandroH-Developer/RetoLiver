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
    @IBOutlet weak var tableview: UITableView!
    
    // Properties
    let plp: PLP = Manager.shared.plp
    var products: [ProductDataModel] = []
    
    private let spacing:CGFloat = 16.0
    
}


// MARK: - Controller methods

extension PLPViewController {
    
    override func viewDidLoad() {
           super.viewDidLoad()
    }
       
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configure()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
}

// MARK: - Setup

extension PLPViewController {
    
    func setUp() {
        
    }
    
    func configure() {
        loadData()
    }
    

    func loadData() {
        
        LoadingView.shared().show()
        downloadProducts {
            LoadingView.shared().remove()
            
            self.tableview.reloadData()
            self.tableview.setContentOffset(.zero, animated: false)
            self.tableview.isHidden = self.products.isEmpty
        }
        
    }
    
    
}


// MARK: - Methods

extension PLPViewController {
    
    func downloadProducts(completion: @escaping (()->())) {
        
        plp.getProducts { (result) in
            
            switch result {
                
            case .success(let products):
                self.products = products
                completion()
                
            case .fail(let message):
                print(message)
                self.showMessage(message, actionTitle: "Aceptar")

            }
         
        }
        
    }
    
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

extension PLPViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProductCell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        let product: ProductDataModel = products[indexPath.item]
        cell.setUp(product: product)
        return cell
    }
        
  
    // Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
