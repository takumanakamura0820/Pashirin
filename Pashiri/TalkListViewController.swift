//
//  TalkTableViewViewController.swift
//  Pashiri
//
//  Created by TAKUMA NAKAMURA on 2019/08/19.
//  Copyright © 2019 NakamuraTakuma. All rights reserved.
//

import UIKit

class TalkListViewController: UIViewController{
    
    @IBOutlet var TableView: UITableView!
    
    var talkArray = ["こんにちは、初めまして。生協にてパンを56個買ってきて欲しいです","いまどこですか？？？","本日はありがとうございました。本当に助かりました！！"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.dataSource = self
        TableView.delegate = self
        TableView.tableFooterView = UIView()
    }
}

extension TalkListViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return talkArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
       // let nameLabel = cell.
        cell.textLabel?.text = talkArray[indexPath.row]
        return cell
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            <#code#>
//        }
//
    
}
