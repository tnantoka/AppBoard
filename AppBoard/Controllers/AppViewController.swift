//
//  AppViewController.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/13/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import UIKit

class AppViewController: UIViewController {

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var descView: UITextView!
    @IBOutlet weak var urlButton: UIButton!
    
    var app: App!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let iconURL = NSURL(string: app.icon), data = NSData(contentsOfURL: iconURL) {
                iconView.image = UIImage(data: data)
        }
        nameLabel.text = app.name
        releasedLabel.text = app.releasedAt.description
        descView.text = app.desc        
        
//        NSData(contentsOfURL: app)
//        iconView.image = UIImage(data:)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
