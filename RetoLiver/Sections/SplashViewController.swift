//
//  SplashViewController.swift
//  RetoLiver
//
//  Created by AlejandroH on 17/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import UIKit


// MARK: - Properties

class SplashViewController: UIViewController {
    

}


// MARK: - Controller Methods

extension SplashViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configure()
    }
        
}


// MARK: - Setup

extension SplashViewController {
    
    func configure() {
        downloadingDummy()
    }
    
    func downloadingDummy() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.goToMain()
        }
    }
    
    func goToMain() {
        let navController: UINavigationController = SearchViewController.instanceFromStoryboard().addNavigationController()
        self.presentViewController(navController, animated: true)
    }
    
    
}
