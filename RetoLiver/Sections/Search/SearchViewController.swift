//
//  SearchViewController.swift
//  RetoLiver
//
//  Created by AlejandroH on 17/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import UIKit


// MARK: - Properties

class SearchViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var tableviewHeight: NSLayoutConstraint?
    
    // Properties
    
}


// MARK: - Controller Methods

extension SearchViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
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

extension SearchViewController {
    
    private func setUp() {
    }
    
    private func configure() {
        self.textField.becomeFirstResponder()
    }
    
}


// MARK: - Methods

extension SearchViewController {
    
    func searchProduct() {
        self.textField.resignFirstResponder()
        closeViewController(animated: true)
        print("Buscando producto")
    }
    
}


// MARK: - Actions

extension SearchViewController {
    
    @IBAction private func didPressSearchProduct(_ sender: UIButton) {
        searchProduct()
    }
    
}


// MARK: - Textfield methods

extension SearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchProduct()
        return true
    }
    
}



// MARK: - Tableview methods

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchCell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchCell
        return cell
    }
    
    // MARK: Delegate
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if let indexP: IndexPath = tableview?.indexPathsForVisibleRows?.last {
            if indexPath.row == indexP.row {
                self.tableviewHeight?.constant = self.tableview?.contentSize.height ?? 0
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchProduct()
    }
    
    
    
}
