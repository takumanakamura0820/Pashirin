//
//  UserPageViewController.swift
//  Pashiri
//
//  Created by TAKUMA NAKAMURA on 2019/08/19.
//  Copyright © 2019 NakamuraTakuma. All rights reserved.
//

import UIKit

class UserPageViewController: UIViewController{
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var likeLabel:UILabel!
    @IBOutlet var unlikeLabel:UILabel!
    var likeNumber:Int = 0
    var unLikeNumber:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "MyPostCollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        //ファイル内処理
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        let margin: CGFloat = 10
        //セルの幅は画面幅を２で割ってmarginひいたもの
        let itemWidth = (Util.returnDisplaySize().width / 2) - (margin * 2)
        //セルの大きさ指定
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        //横セル間の大きさ
        layout.minimumInteritemSpacing = margin * 1
        //セル行間の大きさ
        layout.minimumLineSpacing = margin * 2
        collectionView.collectionViewLayout = layout
        layout.sectionInset = UIEdgeInsets(top: 0, left: margin, bottom: margin, right: margin)
        
    }
}
   extension UserPageViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MyPostCollectionViewCell
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        // Util からでディスプレイサイズ取得
        // Width はそれを使い，高さは適切な値で返してやる
        let returnSize = CGSize(width: Util.returnDisplaySize().width, height: 120)
        
        return returnSize
    }
    @IBAction func countUpButton(){
        likeNumber += 1
        likeLabel.text = String(likeNumber)
    }
    @IBAction func countUpUnlikeButton(){
        unLikeNumber += 1
        unlikeLabel.text = String(unLikeNumber)
    }
    
}
