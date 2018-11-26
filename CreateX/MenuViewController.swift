//
//  MenuViewController.swift
//  CreateX
//
//  Created by Chris Truong on 11/19/18.
//  Copyright © 2018 Chris Truong. All rights reserved.
//

import UIKit

protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index: Int32)
    
}

class MenuViewController: UIViewController {
    
    
    @IBOutlet weak var btnCloseMenuOverlay: UIButton!
    var btnMenu: UIButton!
    var delegate: SlideMenuDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnCloseTapped(_ sender: UIButton) {
        
        btnMenu.tag = 0
        btnMenu.isHidden = false
        if (self.delegate != nil) {
            var index = Int32(sender.tag)
            if (sender == self.btnCloseMenuOverlay) {
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width:
                UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParent()
        })
        
    }
    
    @IBAction func mapButtonTapped(_ sender: Any) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let dvc = mainStoryboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
    
    @IBAction func incidentsButtonTapped(_ sender: Any) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let dvc = mainStoryboard.instantiateViewController(withIdentifier: "IncidentsViewController") as!  IncidentsViewController
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    @IBAction func importButtonTapped(_ sender: Any) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let dvc = mainStoryboard.instantiateViewController(withIdentifier: "ImportViewController") as!  ImportViewController
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    @IBAction func aboutUsButtonTapped(_ sender: Any) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let dvc = mainStoryboard.instantiateViewController(withIdentifier: "AboutUsViewController") as!  AboutUsViewController
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    @IBAction func logoutButtonTapped(_ sender: Any) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let dvc = mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as!  ViewController
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
