//
//  TableViewCell.swift
//  Lidavi_Assignment
//
//  Created by Viswanath on 10/02/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.layer.cornerRadius = 6
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 10
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let bottomSpace: CGFloat = 10
        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 10, bottom: bottomSpace, right: 10))
    }
}
