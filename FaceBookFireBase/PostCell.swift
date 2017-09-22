//
//  PostCell.swift
//  FaceBookFireBase
//
//  Created by OminextMobile on 9/22/17.
//  Copyright © 2017 OminextMobile. All rights reserved.
//

import UIKit

class PostCell: UICollectionViewCell {

  @IBOutlet weak var iconProfile: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        iconProfile.layer.cornerRadius = iconProfile.bounds.height/2.0
        iconProfile.layer.masksToBounds = true
    }

}
