//
//  MenuController.swift
//  FaceBookFireBase
//
//  Created by OminextMobile on 9/22/17.
//  Copyright © 2017 OminextMobile. All rights reserved.
//

import UIKit

class MenuController: UIViewController {

  let cellid = "cellid"
  static let shared = MenuController()
  
  lazy var tableView: UITableView = {
    
    let tbv = UITableView(frame: .zero, style: .plain)
    tbv.translatesAutoresizingMaskIntoConstraints = false
    tbv.register(UITableViewCell.self, forCellReuseIdentifier: self.cellid)
    tbv.delegate = self
    tbv.dataSource = self
    return tbv
    
  }()
  
  override func viewDidLoad() {
        super.viewDidLoad()

    
    view.addSubview(tableView)
    view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tableView]))
    view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tableView]))
  }


}


extension MenuController: UITableViewDelegate {
  
}

extension MenuController: UITableViewDataSource {
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 8
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) 
    cell.textLabel?.text = "menumenumenumenumenumenumenumenumenumenumenumen"
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 50
  }
  
  
}
