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
        _ = URLComponents(url: url, resolvingAgainstBaseURL: true)
      
        
        if aplication.canOpenURL(url) {
            aplication.open(url, options: [:], completionHandler: nil)
        }else {
            print("not have app")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        featch()
        // Do any additional setup after loading the view.
    }

    func featch() {
        if let prefs = UserDefaults(suiteName: "group.com.shareddemo.shar"){
            if let imageData = prefs.object(forKey:    "Image") as? NSData{
                DispatchQueue.main.async(execute: {() -> Void in
                        self.imageView.image = UIImage(data: imageData as Data)
                    }
                        
                    )
                    
                }
        }
    }
    
   
}
    



