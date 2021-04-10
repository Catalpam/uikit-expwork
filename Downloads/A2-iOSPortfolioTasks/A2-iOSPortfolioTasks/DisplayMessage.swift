//
//  DisplayMessage-ext.swift
//  week3lab
//
//  Created by user176152 on 4/3/21.
//

import UIKit

extension UIViewController{
    func displayMessage(message:String, title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
}
