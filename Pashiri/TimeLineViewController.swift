//
//  ViewController.swift
//  Pashiri
//
//  Created by TAKUMA NAKAMURA on 2019/08/19.
//  Copyright © 2019 NakamuraTakuma. All rights reserved.
//

import UIKit
import Alamofire

class TimeLineViewController: UIViewController {
    
    var selectedOrder : Order?
    
    var orders = [Order]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var titleList:[String] = ["焼きそばパン46個欲しい","トイレ並んできてほしい","お茶","月３の授業の席取りお願いしたいです","肩揉みにきて","食堂出前したい","自販機のコーラ５本欲しい","話し相手になって欲しい"]
    
    var nameList:[String] = ["タロウ","たくま","なほ","れい","けんしん","りょうじ","ゆうすけ","ゆうた"]
    var timeList:[String] = ["18:00","17:45","17:45","17:30","17:15","16:00","05:00","04:45"]
    var likeList:[String] = ["13","1","5","4","5","5","12","0"]
    var unLikeList:[String] = ["3","0","0","0","1","2","3","6"]
    var coinList:[String] = ["800","100","100","200","100","200","300","600"]
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "MyPostCollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        
        let layout = UICollectionViewFlowLayout()
        let margin: CGFloat = 8
        //セルの幅は画面幅を２で割ってmarginひいたもの
        let itemWidth = (Util.returnDisplaySize().width / 2) - (margin * 2)
        //セルの大きさ指定
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        //横セル間の大きさ
        layout.minimumInteritemSpacing = margin * 2
        //セル行間の大きさ
        layout.minimumLineSpacing = margin * 2
        collectionView.collectionViewLayout = layout
        layout.sectionInset = UIEdgeInsets(top: 0, left: margin, bottom: margin, right: margin)
        
        //ファイル内処理
        collectionView.delegate = self
        collectionView.dataSource = self
        
//        fetchData()
        
        setRefreshControl()
        
        
    }
//    //fetch＝とってくる
//    func fetchData() {
//        let parameters: [String: Any] = ["user_id": 1]
//        Alamofire.request("http://3.112.22.123:8080/orders",
//                          method: .get,
//                          parameters: parameters,
//                          encoding: URLEncoding.default,
//                          headers: nil)
//            .responseString(completionHandler: { (response) in
//                print(response)
//            }).response { response in
//                if let data = response.data {
//                    do {
//                        let orders: [Order] = try JSONDecoder().decode([Order].self, from: data)
//                        self.orders = orders
//                    } catch {
//                        // エラー処理
//                        print("デコード失敗")
//                    }
//
//
//                }
//        }
//    }
}

// MARK: UICollectionViewDelegate, UICollectionViewDataSource
extension TimeLineViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //let order1 = Order(id:1, userID:1,chargeBy:"",status:"", content:"",coin:100,createdAt:"", updatedAt:"",title:"", time:"", categoryID:"",userName:"")
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    //何個表示
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameList.count
    }
    
    //表示させる内容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MyPostCollectionViewCell
        //let order = self.orders[indexPath.row]
        cell.userNameLabel.text = nameList[indexPath.row]
        cell.titleLabel.text = titleList[indexPath.row]
        cell.timeLabel.text   = timeList[indexPath.row]
        cell.likeLabel.text = likeList[indexPath.row]
        cell.unLikeLabel.text = unLikeList[indexPath.row]
        cell.dateLabel.text = coinList[indexPath.row]
        
       // cell.update(order: order)
        return cell
    }
    //画面の大きさに合わせる
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        // Util からでディスプレイサイズ取得
        // Width はそれを使い，高さは適切な値で返してやる
        let returnSize = CGSize(width: Util.returnDisplaySize().width, height: 120)
        
        return returnSize
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toMyPost", sender: nil)
        collectionView.deselectItem(at: indexPath, animated: true)
        
}
    //引っ張って更新
    func setRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(reloadTimeline(refreshControl:)), for: .valueChanged)
        collectionView.addSubview(refreshControl)
    }
    //同じく引っ張って更新
    @objc func reloadTimeline(refreshControl: UIRefreshControl) {
        refreshControl.beginRefreshing()
        // 更新が早すぎるので2秒遅延させる
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            refreshControl.endRefreshing()
        }

}
}
