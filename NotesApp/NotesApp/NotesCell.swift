//
//  NotesCell.swift
//  NotesApp
//
//  Created by CKM1 on 3/6/18.
//  Copyright © 2018 FSD. All rights reserved.
//

import UIKit

class NotesCell: UITableViewCell {
	
	@IBOutlet weak var lblNotes:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
		
		self.contentView.backgroundColor = selected ? UIColor.lightGray:UIColor.white


        // Configure the view for the selected state
    }

}
