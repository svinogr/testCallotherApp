//
//  ViewController.swift
//  testCallotherApp
//
//  Created by IUser on 18/12/2019.
//  Copyright © 2019 IUser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func openApp(_ sender: Any) {
        let aplication = UIApplication.shared
        let secApp = "editorChords://?getImage=true"
        let url = URL(string: secApp)!
        let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: true)
      
        
        if aplication.canOpenURL(url) {
            aplication.open(url, options: [:], completionHandler: nil)
        }else {
            print("not have app")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

