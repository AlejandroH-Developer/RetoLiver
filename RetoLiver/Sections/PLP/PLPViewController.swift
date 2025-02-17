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
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var warningLabel: UILabel!

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
        setUp()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
}


// MARK: - Setup

extension PLPViewController {
    
    func setUp() {
        loadData(criteria: "mas buscado")
    }


    func loadData(criteria: String) {
        
        self.textField.text = criteria
        
        LoadingView.shared().show()
        downloadProducts(criteria: criteria) {
            LoadingView.shared().remove()
            
            self.tableview.reloadData()
            self.tableview.setContentOffset(.zero, animated: false)
            self.tableview.isHidden = self.products.isEmpty
            self.warningLabel.isHidden = !self.tableview.isHidden
        }
        
    }
    
    
}


// MARK: - Methods

extension PLPViewController {
    
    func downloadProducts(criteria: String, completion: @escaping (()->())) {
        
        plp.getProducts(criteria: criteria) { (result) in
            
            switch result {
                
            case .success(let products):
                self.products = products
                completion()
                
            case .fail(let message):
                print(message)
                self.showMessage(message, actionTitle: "Aceptar")
                completion()

            }
         
        }
        
    }
    
    func goToSearch() {
        let controller: SearchViewController = SearchViewController.instanceFromStoryboard() as! SearchViewController
        controller.delegate = self
        self.presentViewController(controller, animated: true)
    }
    
    func goToPDP(product: ProductDataModel) {
        let controller: PDPViewController = PDPViewController.instanceFromStoryboard() as! PDPViewController
        controller.product = product
        self.pushViewController(controller, animated: true)
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
        let product: ProductDataModel = products[indexPath.item]
        goToPDP(product: product)
    }
    
}


// MARK: SearchController delegate

extension PLPViewController: SearchControllerDelegate {
    
    func didSelect(criteria: String) {
        loadData(criteria: criteria)
    }
   
}
