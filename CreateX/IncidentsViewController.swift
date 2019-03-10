//
//  IncidentsViewController.swift
//  CreateX
//
//  Created by Chris Truong on 11/25/18.
//  Copyright © 2018 Chris Truong. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

struct Incident {
    let image: UIImage?
    let message: String?
}

class IncidentsViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    //var violations = [Violation]()
    var data = [Violation]()
    var one: Violation = Violation()
    var two: Violation = Violation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        
        // Do any additional setup after loading the view.
		
		//loop though all the video incidences
//		let fileManager = FileManager.default
//		let enumerator:FileManager.DirectoryEnumerator = fileManager.enumerator(atPath: "file:///Users/JamesLowe/Library/Developer/CoreSimulator/Devices/178E72DF-3DC6-4B8D-B9B6-B6309F886182/data/Containers/Data/Application/0006F9E5-D3D1-4129-BF05-2456ACA10639/Documents/")!

	//	while let element = enumerator.nextObject() as? String {
	//		if element.hasSuffix("mov") { // checks the extension
				
				
				//let imageFrame : UIImage = try! videoPreviewUIImage(moviePath:  element.asURL())!
				//one.image = imageFrame//UIImage(named: "licensepic1.png")
			//	one.video = "IMG_2874"
			//	one.date = "11/12/2018"
			//	one.location = "190 5th St NW, Atlanta, GA 30332"
			//	one.time = "1:53 PM"
				

				
				
	//		}
	//	}
		
//		let imageFrame : UIImage = videoPreviewUIImage(moviePath: URL(string: "file:///Users/JamesLowe/Library/Developer/CoreSimulator/Devices/178E72DF-3DC6-4B8D-B9B6-B6309F886182/data/Containers/Data/Application/0006F9E5-D3D1-4129-BF05-2456ACA10639/Documents/video.mov")!)!

		
        one.KeyFrameimage = UIImage(named: "handldedit")
        one.videoURL = "IMG_2874"
        one.date = "03/08/2019"
        one.location = "190 5th St NW, Atlanta, GA 30332"
        one.time = "4:53 PM"
		
        
        two.KeyFrameimage = UIImage(named: "IMG_4246.jpg")
        two.videoURL = "IMG_4240"
        two.date = "11/14/2018"
        two.location = "801 Atlantic Drive, Atlanta, GA 30332"
        two.time = "3:26 PM"
        
        data.append(one)
        data.append(two)
            
        
        
        self.tableView.register(IncidentsTableViewCell.self, forCellReuseIdentifier: "custom")
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 200
        
        
    }
	
	func videoPreviewUIImage(moviePath: URL) -> UIImage? {
		let asset = AVURLAsset(url: moviePath)
		let generator = AVAssetImageGenerator(asset: asset)
		generator.appliesPreferredTrackTransform = true
		let timestamp = CMTime(seconds: 2, preferredTimescale: 60)
		if let imageRef = try? generator.copyCGImage(at: timestamp, actualTime: nil) {
			return UIImage(cgImage: imageRef)
		} else {
			return nil
		}
	}
    
    func tableView(_ incidentsTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ incidentsTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom") as! IncidentsTableViewCell
        cell.mainImage = data[indexPath.row].KeyFrameimage
        cell.message = data[indexPath.row].date + "\n" + data[indexPath.row].time
            + "\n" + data[indexPath.row].location
        cell.layoutSubviews()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let dvc = mainStoryboard.instantiateViewController(withIdentifier: "IncidentDetailViewController") as!  IncidentDetailViewController
        dvc.data = data[indexPath.row]
        self.navigationController?.pushViewController(dvc, animated: true)
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
