//
//  ComicsTableViewCell.swift
//  Marvel APP
//
//  Created by Raphael Freschi on 21/03/21.
//

import UIKit
import Alamofire

class ComicsTableViewCell: UITableViewCell {

    @IBOutlet weak var imageComic: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var pages: UILabel!
    
    func updateCell(image: String, title: String, pages: Int){
        
        if image != "" {
            self.imageComic.downloadedFrom(url: URL(string: image)!)
        }
        
        self.title.text = title
        self.pages.text = String(pages)
        
    }
 
}
