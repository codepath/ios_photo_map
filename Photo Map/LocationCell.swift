//
//  LocationCell.swift
//  Photo Map
//
//  Created by Timothy Lee on 10/20/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class LocationCell: UITableViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var location: NSDictionary! {
        didSet {
            nameLabel.text = location["name"] as? String
            addressLabel.text = location.valueForKeyPath("location.address") as? String
            
            var categories = location["categories"] as? NSArray
            if (categories != nil && categories!.count > 0) {
                var category = categories![0] as NSDictionary
                var urlPrefix = category.valueForKeyPath("icon.prefix") as String
                var urlSuffix = category.valueForKeyPath("icon.suffix") as String
                
                var url = "\(urlPrefix)bg_32\(urlSuffix)"
                categoryImageView.setImageWithURL(NSURL(string: url))
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
