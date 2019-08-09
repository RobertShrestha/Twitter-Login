//
//  DetailViewController.swift
//  Twitter-Login
//
//  Created by Robert Shrestha on 3/9/18.
//  Copyright © 2018 Robert Shrestha. All rights reserved.
//

import UIKit
import Kingfisher
import TwitterKit
import TwitterCore

class DetailViewController: UIViewController {
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var lblEmail:UILabel!
    @IBOutlet var profilePIc: UIImageView!
    
    var dic  = Dictionary<String, Any>()

    override func viewDidLoad() {
        super.viewDidLoad()
        let email = dic["email"] as? String ?? ""
        let proPic = dic["profile_image_url"] as! String
        let name = dic["name"] as! String
        
        self.lblName.text = name
        self.lblEmail.text = email
        print(proPic)
        let newString = proPic.replacingOccurrences(of: "normal", with: "bigger")
        let url = URL(string:newString)
        self.profilePIc.kf.setImage(with:url)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signOut(_ sender:Any){
        
        let store = TWTRTwitter.sharedInstance().sessionStore
        if let userID = store.session()?.userID {
            store.logOutUserID(userID)
            self.dismiss(animated: true, completion: nil)
        }

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
