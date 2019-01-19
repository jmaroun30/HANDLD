//
//  ImportViewController.swift
//  CreateX
//
//  Created by Chris Truong on 11/25/18.
//  Copyright © 2018 Chris Truong. All rights reserved.
//

import UIKit
import Alamofire
import AVKit

class ImportViewController: BaseViewController {

	@IBOutlet weak var button: UIButton!
	override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()

        // Do any additional setup after loading the view.
    }
	
	
	@IBAction func onImportTappd(_ sender: Any) {
		importIncidents(completion: {
			self.button.backgroundColor = UIColor.black
		})
	}
	
	
	
	func importIncidents(completion: @escaping () -> ()) {
			let httpEndpoint: String = "http://localhost:8000/data"
		
				Alamofire.request(httpEndpoint, method: .get).responseString { response in
					
					if (response.result.isSuccess) {
						do {
							print("upload done")
							print("Data:" , response.result.value)
							completion()
						} catch let parsingError {
							print("Error: ", parsingError)
						}
					} else {
						print("request error: ", response.error)
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

}
