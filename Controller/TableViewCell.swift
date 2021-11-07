//
//  TableViewCell.swift
//  ToDoList
//
//  Created by Youssef on 25/10/2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    //MARK: - OUTLETS
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var deadlineLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var priorityView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        priorityView.layer.cornerRadius = priorityView.frame.height/2
        cellView.layer.cornerRadius = cellView.frame.height/5
        startDateLabel.layer.cornerRadius = startDateLabel.frame.height/2
        deadlineLabel.layer.cornerRadius = deadlineLabel.frame.height/2
    }
    
}
