//
//  WebViewController.swift
//  FansArea
//
//  Created by Weilong Zhao on 30/5/17.
//  Copyright © 2017 Weilong Zhao. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.isHidden = true
        let wkWebview = WKWebView(frame: view.frame)
        view.addSubview(wkWebview)
        
        wkWebview.autoresizingMask = [.flexibleHeight]
        
        if let url = URL(string: "https://www.google.com.sg/") {
            let request = URLRequest(url: url)
            //webView.loadRequest(request)
            wkWebview.load(request)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
