//
//  ViewController.swift
//  anySignPlugin
//
//  Created by BJCA on 16/4/20.
//  Copyright © 2016年 YSdang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
                      UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate{

    
    @IBOutlet weak var photoView: UIImageView!
    
    @IBOutlet weak var height: NSLayoutConstraint!
    
    @IBAction func takePhoto(sender: UIButton) {
        
        let junk = UIImagePickerController()
        
        let sourceType = UIImagePickerControllerSourceType.Camera
        
        if (UIImagePickerController.isSourceTypeAvailable(sourceType)) {
        
            junk.sourceType = sourceType
            
        } else {
        
//            let a = UIAlertController.init(title: "Stop!", message: "NO camera", preferredStyle: )
          
//            a.show
        
        }
        
        junk.delegate = self
        
        self.presentViewController(junk, animated: true, completion: nil)
    
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let screenW:CGFloat = UIScreen.mainScreen().bounds.width
        
        self.height.constant = screenW * 320 / 240
    
    }


    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[String : AnyObject]) {
        
        let image: UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        self.photoView.image = image
        
        self.photoView.frame.size = image.size
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }

    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    
    }
}


