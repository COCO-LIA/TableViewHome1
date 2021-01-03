//
//  Cell2.swift
//  TableViewHome1
//
//  Created by 황현지 on 2021/01/03.
//

import UIKit

class Cell2: UITableViewCell {
    
    //6-1
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    //swift 글로벌에 미리 정의가 되어있는 이름임.
    @IBOutlet weak var imgView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
