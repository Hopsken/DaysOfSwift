//
//  AboutViewController.swift
//  BullEye
//
//  Created by shaowei on 2016/10/5.
//  Copyright © 2016年 shaowei. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlFile = Bundle.main.path(forResource: "BullsEye", ofType: "html"){
            if let htmlData = NSData(contentsOfFile: htmlFile) {
                let baseURL = NSURL(fileURLWithPath: Bundle.main.bundlePath)
                webView.load(htmlData as Data, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL as URL)
            }
        }
    }

}
