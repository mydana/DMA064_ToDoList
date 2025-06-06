//
//  ToDoCellTableViewCell.swift
//  DMA064_ToDoList
//
//  Created by Dana Runge on 6/6/25.
//

import UIKit

protocol ToDoCellDelegate: AnyObject {
    func checkmarkTapped(sender: ToDoCellTableViewCell)
}

class ToDoCellTableViewCell: UITableViewCell {
    weak var delegate: ToDoCellDelegate?

    @IBOutlet var isCompleteButton: UIButton!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBAction func completeButtonTapped(_ sender: Any) {        delegate?.checkmarkTapped(sender: self)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
