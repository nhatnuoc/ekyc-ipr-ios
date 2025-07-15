//
//  InfoTableViewCell.swift
//  KYCProject
//
//  Created by admin on 28/11/2022.
//

import UIKit

class ShowCardInfoTextTableViewCell: UITableViewCell {

    @IBOutlet weak var bottomLine: UIView!
    @IBOutlet weak var contentLb: UILabel!
    @IBOutlet weak var nameLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.nameLb.textColor = .gray
        self.contentLb.textColor = .black
//        self.backgroundColor = .clear
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension ShowCardInfoTextTableViewCell:XibInitialization {
    typealias Element = ShowCardInfoTextTableViewCell
}
