//
//  SearchViewController.swift
//  RetoLiver
//
//  Created by AlejandroH on 17/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import UIKit

// MARK: - Protocol

protocol SearchControllerDelegate: class {
    func dismiss()
}


// MARK: - Properties

class SearchViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var tableviewHeight: NSLayoutConstraint?
    
    // Properties
    var searches: [String] = []
    
    weak var delegate: SearchControllerDelegate?
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
        loadData()
    }
    
    private func configure() {
        self.textField.becomeFirstResponder()
    }
    
    private func loadData() {
        self.searches = SearchHistoryData.shared.loadHistory()
        self.tableview.reloadData()
    }
    
    private func reloadData() {
        loadData()
    }
    
}


// MARK: - Methods

extension SearchViewController {
    
    func search(_ criteria: String?) {
        guard let text: String = criteria, !text.isEmpty else { return }
        print("Buscando producto")
        self.delegate?.dismiss()
        SearchHistoryData.shared.addSearch(text)
        closeViewController(animated: true) {
            SearchHistoryData.shared.saveHistory()
        }
        
    }
    
    func remove(_ criteria: String?) {
        guard let text: String = criteria, !text.isEmpty else { return }
        print("Búsqueda \(text) eliminada")
        SearchHistoryData.shared.removeSearch(text)
        SearchHistoryData.shared.saveHistory()
        reloadData()
    }
    
}


// MARK: - Actions

extension SearchViewController {
    
    @IBAction private func didPressSearch(_ sender: UIButton) {
        search(textField.text)
    }
    
    @IBAction private func didPressClose(_ sender: UIButton) {
        closeViewController(animated: true)
    }
    
}


// MARK: - Textfield methods

extension SearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        search(textField.text)
        return true
    }
    
}



// MARK: - Tableview methods

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchCell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchCell
        let criteria: String = searches[indexPath.row]
        cell.setUp(target: self, criteria: criteria)
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
        let criteria: String = searches[indexPath.row]
        search(criteria)
    }
    
}



// MARK: - SearchCell methods

extension SearchViewController: SearchCellDelegate {
    
    func remove(criteria: String) {
        remove(criteria)
    }
    
    
}
