//
//  ViewController.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/9/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import UIKit

import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let realm = try! Realm()
        let board = Board()
        board.name = "test"

        let app1 = App()
        app1.name = "App 1"
        app1.board = board

        let app2 = App()
        app2.name = "App 2"
        app2.board = board

        try! realm.write {
            realm.deleteAll()
            realm.add(board)
            realm.add(app1)
            realm.add(app2)
        }
        
        let board2 = realm.objects(Board.self).first!
        print(board2)
        print(board2.apps)
        
        print(realm.objects(Board).count)
        print(realm.objects(App).count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

