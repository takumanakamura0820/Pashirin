//
//  TalkViewController.swift
//  Pashiri
//
//  Created by TAKUMA NAKAMURA on 2019/08/20.
//  Copyright © 2019 NakamuraTakuma. All rights reserved.
//

import UIKit

class TalkViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {

    @IBOutlet var talkTableView: UITableView!
    @IBOutlet var talkTextField : UITextField!
    
    @IBOutlet var sendButton : UIButton!
    var talkList:[String] = ["こんにちは、初めまして。生協にて焼きそばパンを56個買ってくるので大丈夫ですか？？","大丈夫です！量多いと思いますが頑張ってください！","はい、多いので小分けで持っていきます18時に運び終われば大丈夫ですか！？"]
    var userList :[String] = ["ゆうた","タロウ","ゆうた"]
 
    override func viewDidLoad() {
        super.viewDidLoad()

        talkTableView.delegate = self
        talkTableView.dataSource = self
        talkTextField.delegate = self
        talkTableView.estimatedRowHeight = 150
        talkTableView.rowHeight = UITableView.automaticDimension
       
        
        let nib = UINib(nibName: "TalkTableViewCell", bundle: Bundle.main)
        talkTableView.register(nib, forCellReuseIdentifier: "Cell")
        
        talkTableView.tableFooterView = UIView()
        
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapSendButton(){
        guard let talk = talkTextField.text else {
            print ("メッセージが入力されていません")
            return
        }
        talkList.append(talk)
        userList.append("タロウ")
        talkTableView.reloadData()
    }
}
extension TalkViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return talkList.count
    }
    //内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TalkTableViewCell
        cell.userLabel.text = userList[indexPath.row]
        cell.talkTextView.text = talkList[indexPath.row]
        print(talkList[indexPath.row])
        return cell
    }
   

}


