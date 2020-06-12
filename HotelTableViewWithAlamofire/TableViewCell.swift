//
//  TableViewCell.swift
//  HotelTableViewWithAlamofire
//
//  Created by Sathsara Maduranga on 6/10/20.
//  Copyright © 2020 Sathsara Maduranga. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var lbldescription: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        img.layer.cornerRadius = img.frame.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
