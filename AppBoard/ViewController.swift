//
//  ViewController.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/9/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import UIKit

import RealmSwift
import APIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
                
        let realm = try! Realm()
        let board = Board()
        board.name = "test"

        let board2 = Board()
        board2.name = "test2"

        let app1 = App()
        app1.name = "App 1"
        board.apps.append(app1)

        let app2 = App()
        app2.name = "App 2"
        board.apps.append(app2)

        try! realm.write {
            realm.deleteAll()
            realm.add(board)
            realm.add(board2)
            realm.add(app1)
            realm.add(app2)
        }
        
        let board1 = realm.objects(Board.self).first!
        print(board1)
        print(board1.apps)
        
        print(realm.objects(Board).count)
        print(realm.objects(App).count)
        
        let request = ITunesAPI.SearchSoftwaresRequest(query: "JavaScript Anywhere").requestWithPage(1)
        Session.sendRequest(request) { result in
            switch result {
            case .Success(let response):
                print(response.elements.count)
                print(response.elements.first!.name)
                print(response.elements.first!.description)
                print(response.elements.first!.icon)
                print(response.elements.first!.url)
            case .Failure(let error):
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

