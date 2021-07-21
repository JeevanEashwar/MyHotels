//
//  HotelTableViewCell.swift
//  MyHotels
//
//  Created by Jeevan on 21/07/21.
//

import UIKit

class HotelTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var hotelImageView: UIImageView!
    @IBOutlet weak var hotelName: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(hotelViewModel: HotelViewModel, indexPath: IndexPath) {
        hotelImageView.image = hotelViewModel.hotelImage
        hotelName.attributedText = hotelViewModel.nameOfTheHotel
        rating.attributedText = hotelViewModel.rating
        containerView.addCardLook()
        containerView.backgroundColor = UIColor.themeColor(type: .light)
        hotelImageView.addCardLook()
    }
    
}
