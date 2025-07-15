//
//  RegistrationInstructionTableViewCell.swift
//  QTSIdentityApp
//
//  Created by admin on 20/12/2023.
//

import UIKit

class EkycInstructionTableViewCell: UITableViewCell {

    @IBOutlet weak var subTitleLb: UILabel!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension EkycInstructionTableViewCell: XibInitialization {
    typealias Element = EkycInstructionTableViewCell
}
