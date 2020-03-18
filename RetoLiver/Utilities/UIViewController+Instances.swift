//
//  UIViewController+Instances.swift
//  RetoLiver
//
//  Created by AlejandroH on 17/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Storyboard file

enum StoryboardFile: String {
    case Main
}


// MARK: - Create view controller instances

extension UIViewController {
    
    class func instanceFromStoryboard(_ storyboard: StoryboardFile = .Main) -> UIViewController {
        let identifier: String = String(describing: self)
        let controller: UIViewController = instanceFromStoryboard(storyboard, withIdentifier: identifier)
        controller.setNeedsStatusBarAppearanceUpdate()
        return controller
    }
    
    class func instanceFromStoryboard(_ storyboard: StoryboardFile, withIdentifier identifier: String) -> UIViewController {
        return UIStoryboard(name: storyboard.rawValue, bundle: nil).instantiateViewController(identifier: identifier)
    }
    
}


// MARK: - Adding navigation

extension UIViewController {
    
    func addNavigationController() -> UINavigationController {
        let navigation = UINavigationController(rootViewController: self)
        navigation.setNavigationBarHidden(true, animated: false)
        return navigation
    }
    
}


// MARK: - Presentation

extension UIViewController {

    func presentViewController(_ controller: UIViewController, modalPresentationStyle style: UIModalPresentationStyle = .overFullScreen, animated: Bool, completion: (()->())? = nil) {
        controller.modalPresentationStyle = style
        self.present(controller, animated: animated, completion: completion)
    }
    
    func pushViewController(_ controller: UIViewController, modalPResentationStyle style: UIModalPresentationStyle = .overFullScreen, animated: Bool, completion:(()->())? = nil) {
        controller.modalPresentationStyle = style
        self.navigationController?.pushViewController(controller, animated: animated)
        completion?()
    }
    
}


// MARK: - Close

extension UIViewController {
    
    func closeViewController(animated: Bool, completion: (()->())? = nil) {
        self.view.endEditing(true)
        
        guard let navigation: UINavigationController = self.navigationController else {
            self.dismiss(animated: animated, completion: completion)
            return
        }
        
        navigation.popViewController(animated: animated)
        completion?()
        
    }
    
}
