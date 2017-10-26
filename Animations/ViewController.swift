//
//  ViewController.swift
//  Animations
//
//  Created by Sohayb Khan on 16/09/2017.
//  Copyright © 2017 Sohayb Khan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {	

    @IBAction func fadeIn(_ sender: Any) {
        image.alpha = 0
        
        UIView.animate(withDuration: 2, animations:
            {
                self.image.alpha = 1
        })
    }
    @IBAction func slideIn(_ sender: Any) {
        
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        UIView.animate(withDuration: 2)
        {
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
        }
    }
    @IBAction func grow(_ sender: Any) {
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        UIView.animate(withDuration: 2)
        {
            self.image.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        }
    }
    @IBOutlet var image: UIImageView!
    @IBOutlet var button: UIButton!
    
    var count = 1
    var timer = Timer()
    var isAnimating = false
    
    func animate()
    {
        image.image = UIImage(named: "image\(count).jpg")
        
        count += 1
        
        if count == 5
        {
            count = 0
        }
    }
    
    @IBAction func next(_ sender: Any) {
        
        if isAnimating == true
        {
            timer.invalidate()
            button.setTitle("Start", for: [])
            isAnimating = false
        }
        else
        {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            button.setTitle("Stop", for: [])
            isAnimating = true
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

