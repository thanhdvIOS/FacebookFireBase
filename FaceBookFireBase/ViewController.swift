//
//  ViewController.swift
//  FaceBookFireBase
//
//  Created by OminextMobile on 9/22/17.
//  Copyright © 2017 OminextMobile. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

  let cellid = "cellid"
  var handleSwitchMenu: (() -> ())? = nil
  
  var widthCollectionCell: CGFloat {
    return UIScreen.main.bounds.width - 16
  }
  
  var heightCollectionCell: CGFloat {
    return UIScreen.main.bounds.height * 0.4
  }
  
  
  lazy var collectionView: UICollectionView = {
    
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.translatesAutoresizingMaskIntoConstraints = false
    cv.backgroundColor = .gray
    cv.delegate = self
    cv.dataSource = self
    cv.register(UINib(nibName: "PostCell", bundle: nil), forCellWithReuseIdentifier: self.cellid)
    return cv
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(handleMenuBar))
    
    view.addSubview(collectionView)
    view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":collectionView]))
    view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":collectionView]))
    
  }


  func handleMenuBar() {
    
    handleSwitchMenu?()
  }
  
}


extension ViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! PostCell
    return cell
  }
  
}

extension ViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize(width: widthCollectionCell, height: heightCollectionCell)
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
  
}

extension ViewController: UICollectionViewDelegate {
  
  
}
