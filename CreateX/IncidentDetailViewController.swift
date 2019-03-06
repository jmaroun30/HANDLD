//
//  IncidentDetailViewController.swift
//  CreateX
//
//  Created by Chris Truong on 11/26/18.
//  Copyright © 2018 Chris Truong. All rights reserved.
//

import UIKit
import AVKit

class IncidentDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var data: Violation?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = data?.KeyFrameimage
        dateTextField.text = data?.date
        timeTextField.text = data?.time
        locationTextField.text = data?.location
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func videoButtonTapped(_ sender: Any) {
        if let path = Bundle.main.path(forResource: data?.videoURL, ofType: "MOV") {
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true, completion: {
                video.play()
            })
        }
        
        
    }
    
    
    @IBAction func reportButtonTapped(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Do you wish to report this incident?", message: nil, preferredStyle: .actionSheet)
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        actionSheet.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (UIAlertAction) in
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "No", style: .default, handler: { (UIAlertAction) in
            self.present(imagePickerController, animated: true, completion: nil)
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
