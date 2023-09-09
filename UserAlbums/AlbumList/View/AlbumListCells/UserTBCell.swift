//
//  UserTBCell.swift
//  UserAlbums
//
//  Created by Asmaa_Abdelfattah on 17/06/1402 AP.
//

import UIKit

class UserTBCell: UITableViewCell {
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var userAddressLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
