//
//  ComicsDetailViewController.swift
//  Marvel APP
//
//  Created by Raphael Freschi on 22/03/21.
//

import UIKit

class ComicsDetailViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var price: Label!
    @IBOutlet weak var description: UITextView!
    @IBOutlet weak var creators: Label!
    
    var imageUrl:String?
    var price: String?
    var desc:String?
    var creator:String?
    var title: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.image = downloadedFrom(url: URL(string: imageUrl))
        self.price = price
        self.description = desc
        self.creators = creator
        
        self.navigationItem.title = self.title
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
