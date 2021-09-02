//
//  MostViewedTVCell.swift
//  Generic
//
//  Created by Jahan on 02/09/2021.
//

import UIKit
import Kingfisher

class MostViewedTVCell: UITableViewCell {

    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var storyImageView: CustomImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(model : MostViewedModel){
        self.lblTitle.text = model.title
        self.lblAuthor.text = model.byline
        self.lblCategory.text = model.type
        self.lblDate.text = model.publishedDate
        if model.media.count > 0 {
            let media = model.media[0]
            if media.mediaMetadata.count > 0 {
                let metadata = media.mediaMetadata[0]
                if let url = URL(string: metadata.url) {
                    self.storyImageView.kf.setImage(with: url)
                }
            }
        }
    }
    
}
