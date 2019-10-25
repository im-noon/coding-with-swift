//
//  receiverMessageCell.swift
//  Flash Chat
//
//  Created by Slimn Srarena on 17/9/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import UIKit

class receiverMessageCell: UITableViewCell {

    @IBOutlet var messageView: UIView!
    @IBOutlet var imageAvatar: UIImageView!
    @IBOutlet var labelMessageBody: UILabel!
    @IBOutlet var labelUsername: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
