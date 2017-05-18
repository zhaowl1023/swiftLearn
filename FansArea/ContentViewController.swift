//
//  ContentViewController.swift
//  FansArea
//
//  Created by Weilong Zhao on 19/5/17.
//  Copyright © 2017 Weilong Zhao. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var labelHeading: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelFooter: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btnDone: UIButton!
    
    var index = 0
    var heading = ""
    var imagename = ""
    var footer = ""
    
    @IBAction func doneBtnTap(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        defaults.setValue(true, forKey: "GuideShow")
        
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.currentPage = index
        labelHeading.text = heading
        labelFooter.text = footer
        imageView.image = UIImage(named: imagename)

        btnDone.isHidden = (index != 2)
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
