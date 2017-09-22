//
//  ContainerController.swift
//  FaceBookFireBase
//
//  Created by OminextMobile on 9/22/17.
//  Copyright © 2017 OminextMobile. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {

  let alignLeft: CGFloat = -70
  var leftMenu = false
  var centerController: ViewController?
  weak var leftController: MenuController?
  
  override func viewDidLoad() {
    super.viewDidLoad()

    centerController = ViewController()
    
    let navCenterController = UINavigationController(rootViewController: centerController!)
    addChildViewController(navCenterController)
    view.addSubview(navCenterController.view)
    navCenterController.didMove(toParentViewController: self)
    
    centerController?.handleSwitchMenu = {
      
      //print("asdasdas")
      
      //if self.leftMenu == true {
        self.leftController = MenuController.shared
        self.addChildViewController(self.leftController!)
        self.view.addSubview(self.leftController!.view)
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
          
          self.leftController?.view.frame.origin.x = self.alignLeft
        }, completion: nil)
      //}
      self.leftMenu = true
      
    }
    
    view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSwitchRight)))
    view.isUserInteractionEnabled = true
  }

  
  func handleSwitchRight(){
    if let left = leftController, leftMenu == true {
 
      UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
        
        left.view.frame.origin.x = -UIScreen.main.bounds.width
      }, completion: nil)
      
      
      leftMenu = false
      
    }
  }
  
}
