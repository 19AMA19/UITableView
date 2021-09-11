//
//  HomeTableViewCell.swift
//  UITableView
//
//  Created by Abdulkarim Alansari on 04/02/1443 AH.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var imgFruit: UIImageView!
    @IBOutlet weak var lblFruitName: UILabel!
    @IBOutlet weak var lblFruitPrice: UILabel!
    @IBOutlet weak var lblDesFruit: UILabel!
    @IBOutlet weak var btnFovFruit: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(photo: UIImage, name: String, price: String, description: String) {
        
        imgFruit.image = photo
        lblFruitName.text = name
        lblFruitPrice.text = "\(price) SAR"
        lblDesFruit.text = description
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
