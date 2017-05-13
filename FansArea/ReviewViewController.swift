//
//  ReviewViewController.swift
//  FansArea
//
//  Created by Weilong Zhao on 4/5/17.
//  Copyright © 2017 Weilong Zhao. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    var rating :String?

    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var ratingStackView: UIStackView!
    @IBAction func ratingTap(_ sender: UIButton) {
        switch sender.tag{
        case 100: rating = "dislike"
        case 101: rating = "good"
        case 102: rating = "great"
        default: break
        }
        
        performSegue(withIdentifier: "unwindToDetailView", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blurEffectView.frame = view.frame
        bgImageView.addSubview(blurEffectView)
        //ratingStackView.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        let startPos = CGAffineTransform(translationX: 0, y: 500)
        let startScale = CGAffineTransform(scaleX: 0, y: 0)
        ratingStackView.transform = startScale.concatenating(startPos)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.3) { 
         
         let endPos = CGAffineTransform(translationX: 0, y: 0)
         let endScale = CGAffineTransform.identity
         
         self.ratingStackView.transform = endScale.concatenating(endPos)
        }
        
        /*
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            
            let endPos = CGAffineTransform(translationX: 0, y: 0)
            let endScale = CGAffineTransform.identity
            
            self.ratingStackView.transform = endScale.concatenating(endPos)
        }, completion: nil)
        */
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
