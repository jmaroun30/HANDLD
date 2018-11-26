//
//  IncidentDetailViewController.swift
//  CreateX
//
//  Created by Chris Truong on 11/26/18.
//  Copyright © 2018 Chris Truong. All rights reserved.
//

import UIKit
import AVKit

class IncidentDetailViewController: UIViewController {
    
    var data: Violation?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = data?.image
        dateTextField.text = data?.date
        timeTextField.text = data?.time
        locationTextField.text = data?.location
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func videoButtonTapped(_ sender: Any) {
        if let path = Bundle.main.path(forResource: data?.video, ofType: "MOV") {
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true, completion: {
                video.play()
            })
        }
        
        
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
