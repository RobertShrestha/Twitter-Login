//
//  ViewController.swift
//  Twitter-Login
//
//  Created by Robert Shrestha on 6/3/18.
//  Copyright © 2018 Robert Shrestha. All rights reserved.
//

import UIKit
import TwitterKit
import TwitterCore

class ViewController: UIViewController {
    
    @IBOutlet weak var loginBtn:UIButton!
    //let client = TWTRAPIClient.withCurrentUser()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        TWTRTwitter.sharedInstance().logIn(completion: { (session, error) in
            if (session != nil) {
                print("signed in as \(session?.userName ?? "")");
                let twitterClient = TWTRAPIClient(userID: session?.userID)
                twitterClient.loadUser(withID: (session?.userID)!, completion: { (user, error) in
                    print(user!.profileImageURL)
//                    let client = TWTRAPIClient.withCurrentUser()
//
//                    client.requestEmail { email, error in
//                        if (email != nil) {
//                            print(email ?? "" )
//                            print("signed in as \(session?.userName ?? "")");
//                        } else {
//                            print("error: \(error?.localizedDescription ?? "")" );
//                        }
//                    }
                    self.twitterHelper()
                })
            } else {
                print("error: \(error?.localizedDescription ?? "")");
            }
        })
    }
    
    func twitterHelper(){
        let client = TWTRAPIClient.withCurrentUser()
        
        
        
        let id = client.userID
        let request = client.urlRequest(withMethod: "GET",
                                        urlString: "https://api.twitter.com/1.1/account/verify_credentials.json",
                                        parameters: ["include_email": "true", "skip_status": "true","user_id":id!],
                                        error: nil)
        
        
        
        client.sendTwitterRequest(request) { response, data, connectionError in
            
            
            if data != nil {
                
                do {
                    if let jsonArray = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, AnyObject> {
                        
                        let s = jsonArray
                        print(s)
                        let email = s["email"] as? String ?? ""
                        let proPic = s["profile_image_url"] as! String
                        
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController")  as! DetailViewController
                        vc.dic = s
                        self.present(vc, animated: true, completion: nil)
                        print(email,proPic)
                        
                    }
                }
                
            }
            
        }
        
    }
}

