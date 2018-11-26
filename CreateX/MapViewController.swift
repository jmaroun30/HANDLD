//
//  MapViewController.swift
//  CreateX
//
//  Created by Chris Truong on 11/19/18.
//  Copyright © 2018 Chris Truong. All rights reserved.
//

import UIKit

class MapViewController: BaseViewController {
    
    var data = [Violation]()
    var one: Violation = Violation()
    var two: Violation = Violation()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSlideMenuButton()

        // Do any additional setup after loading the view.
        
        one.image = UIImage(named: "IMG_4231.png")
        one.video = "IMG_4146.mov"
        one.date = "11/12/2018"
        one.location = "190 5th St NW, Atlanta, GA 30332"
        one.time = "1:53 PM"
        
        
        two.image = UIImage(named: "IMG_4232.png")
        two.video = "IMG_4233.mov"
        two.date = "11/14/2018"
        two.location = "801 Atlantic Drive, Atlanta, GA 30332"
        two.time = "3:26 PM"
        
        data.append(one)
        data.append(two)
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
