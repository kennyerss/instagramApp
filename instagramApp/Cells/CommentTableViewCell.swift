//
//  CommentTableViewCell.swift
//  instagramApp
//
//  Created by Kent Brylle Canonigo on 10/22/22.
//

import UIKit
import Parse
import AlamofireImage

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var userLabel: UILabel!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
