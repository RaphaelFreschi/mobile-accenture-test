//
//  ComicsViewController.swift
//  Marvel APP
//
//  Created by Raphael Freschi on 21/03/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class ComicsViewController: UIViewController {
    
    var offset = 0
        
    @IBOutlet weak var comicsTableView: UITableView!
    
    var comics = [comicsInfos]() {
        didSet {
            DispatchQueue.main.async {
                self.comicsTableView.reloadData()
            }
        }
    }
    
    var comicsRequest:ComicsRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        comicsTableView.register(UINib(nibName: "ComicsCell", bundle: nil), forCellReuseIdentifier: "ComicsCell")
        
        comicsTableView.dataSource = self
        comicsTableView.delegate = self
        
        self.comicsRequest = ComicsRequest(comicID: 0, offset: self.offset)
        comicsRequest?.getComics { [weak self] result in
            switch result{
             case .failure(let error):
                print(error)
             case .success(let comics):
                self?.comics = comics
            }
        }
     
    }
    

}

extension ComicsViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (comicsTableView.contentSize.height - 100)-scrollView.frame.size.height {
            
            self.offset += 10
            
            comicsRequest?.getComics { [weak self] result in
                switch result{
                 case .failure(let error):
                    print(error)
                 case .success(let comics):
                    self?.comics = comics
                }
            }
            
            comicsTableView.reloadData()
        }
    }
}

extension ComicsViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.comics.count == 0 ? 1 : self.comics.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComicsCell", for: indexPath) as! ComicsTableViewCell
        
        if self.comics.count != 0 {
            let comicsCell = self.comics[indexPath.row]
            
            print("ITEMS \(comicsCell) ")
            
            cell.updateCell(image: comicsCell.thumbnail.path
                            , title: comicsCell.title, pages: comicsCell.pagesCount)
        }
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "listToDetail", sender: nil)
    }
    
    
}

