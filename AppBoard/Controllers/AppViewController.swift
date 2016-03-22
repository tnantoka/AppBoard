//
//  AppViewController.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/13/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import UIKit
import Symday
import QuickResponse

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
        title = app.name
        
        if let iconURL = NSURL(string: app.icon), data = NSData(contentsOfURL: iconURL) {
                iconView.image = UIImage(data: data)
        }
        nameLabel.text = app.name
        releasedLabel.text = Symday().format(app.releasedAt)

        descView.text = app.desc
        
        urlButton.setImage(QuickResponse(message: app.url).scaled(8.0).code, forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func urlButtonDidTap(sender: AnyObject) {
        guard let url = NSURL(string: app.url) else { return }

        let alertController = UIAlertController(
            title: NSLocalizedString("Open in Safari", comment: ""),
            message: app.url,
            preferredStyle: .Alert
        )
        alertController.addAction(
            UIAlertAction(
                title: NSLocalizedString("Open", comment: ""),
                style: .Default,
                handler: { _ in
                    UIApplication.sharedApplication().openURL(url)
                }
            )
        )
        alertController.addAction(
            UIAlertAction(
                title: NSLocalizedString("Cancel", comment: ""),
                style: .Cancel,
                handler: nil
            )
        )
        presentViewController(alertController, animated: true, completion: nil)
    }
}
