//
//  ShareViewController.swift
//  share
//
//  Created by IUser on 19/12/2019.
//  Copyright © 2019 IUser. All rights reserved.
//

import UIKit
import Social
import MobileCoreServices

class ShareViewController: SLComposeServiceViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        placeholder = "Что то написать"
    }
    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
        // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
       // self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
        self.datachment()
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }
    
    func datachment() {
        let content = extensionContext?.inputItems[0] as! NSExtensionItem
        let contentType = kUTTypeImage as String
        
        for atachment in content.attachments as! [NSItemProvider] {
            if atachment.hasItemConformingToTypeIdentifier(contentType) {
                atachment.loadItem(forTypeIdentifier: contentType, options: nil){
                    data, error in
                    if error == nil {
                        let url = data as! NSURL
                        if let imageData = NSData(contentsOf: url as URL){
                            self.saveDataToUserDefault(suitName: "group.com.shareddemo.shar", dataKey: "Image", dataValue: imageData)
                        }
                    } else{
                        //show alert
                    }
                    
                }
                    
                
            }
        }
    }

    func saveDataToUserDefault(suitName: String, dataKey: String, dataValue: AnyObject) {
        if let prefs = UserDefaults(suiteName: suitName){
            prefs.removeObject(forKey: dataKey)
            prefs.set(dataValue, forKey: dataKey)
        }
        
    }
    
}
