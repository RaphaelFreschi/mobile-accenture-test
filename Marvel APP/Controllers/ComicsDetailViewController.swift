//
//  ComicsDetailViewController.swift
//  Marvel APP
//
//  Created by Raphael Freschi on 22/03/21.
//

import UIKit

class ComicsDetailViewController: UIViewController {

    @IBOutlet weak var imageComic: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var creators: UILabel!
    @IBOutlet var description: UITextView!
    
    var imageUrl:String?
    var priceComics: String?
    var desc:String?
    var creator:String?
    var titleNav: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageComic.downloadedFrom(url: URL(string: self.imageUrl!)!)
        self.price.text = priceComics
        self.description.text = desc
        self.creators.text = creator
        self.navigationItem.title = titleNav

    }

}

extension ComicsDetailViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text!)
    }
    
}

