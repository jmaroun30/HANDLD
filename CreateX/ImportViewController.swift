//
//  ImportViewController.swift
//  CreateX
//
//  Created by James Lowe on 11/25/18.
//  Copyright © 2018 James Lowe. All rights reserved.
//

import UIKit
import Alamofire
import AVKit

class ImportViewController: BaseViewController {
	
	var db: OpaquePointer?
	@IBOutlet weak var button: UIButton!
	override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()

        // Do any additional setup after loading the view.
    }
	
	@IBOutlet weak var progressView: UIProgressView!
	
	@IBAction func onImportTappd(_ sender: Any) {
		importIncidents(completion: {
			self.button.backgroundColor = UIColor.black
		})
	}
	
	
	
	func importIncidents(completion: @escaping () -> ()) {
			let httpEndpoint: String = "http://localhost:8000/download"
			let playerController = AVPlayerViewController()
			self.progressView.progress = 0.0
		Alamofire.request(httpEndpoint).downloadProgress(closure : { (progress) in
			print(progress.fractionCompleted)
			self.progressView.progress = Float(progress.fractionCompleted)
		}).responseData{ (response) in
			print(response)
			print(response.result.value!)
			print(response.result.description)
			if let data = response.result.value {
				
				let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
				let videoURL = documentsURL.appendingPathComponent("video.mov")
				//let videoURL:URL = URL(string: "data/video.mov")!
				do {
					try data.write(to: videoURL)
				} catch {
					print("Something went wrong!")
				}
				print(videoURL)
				//DbManager.saveToDb();
				
				var violation: Violation = Violation()
				violation.date = "date"
				violation.location = "location"
				violation.time = "time"
				violation.videoURL = "videoURL"
				DbManager.saveToDb(violation: violation)
				
				//let player = AVPlayer(url: videoURL as URL)
				//playerController.player = player
				//self.addChild(playerController)
				//self.view.addSubview(playerController.view)
				//playerController.view.frame = self.view.frame
				//player.play()
				
			}
		}
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
