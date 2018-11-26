//
//  IncidentsViewController.swift
//  CreateX
//
//  Created by Chris Truong on 11/25/18.
//  Copyright © 2018 Chris Truong. All rights reserved.
//

import UIKit

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
        
        one.image = UIImage(named: "IMG_4231.png")
        one.video = "IMG_4146"
        one.date = "11/12/2018"
        one.location = "190 5th St NW, Atlanta, GA 30332"
        one.time = "1:53 PM"
    
        
        two.image = UIImage(named: "IMG_4232.png")
        two.video = "IMG_4233"
        two.date = "11/14/2018"
        two.location = "801 Atlantic Drive, Atlanta, GA 30332"
        two.time = "3:26 PM"
        
        data.append(one)
        data.append(two)
            
        
        
        self.tableView.register(IncidentsTableViewCell.self, forCellReuseIdentifier: "custom")
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 200
        
        
    }
    
    func tableView(_ incidentsTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ incidentsTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom") as! IncidentsTableViewCell
        cell.mainImage = data[indexPath.row].image
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
