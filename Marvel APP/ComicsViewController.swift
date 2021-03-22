//
//  ComicsViewController.swift
//  Marvel APP
//
//  Created by Raphael Freschi on 21/03/21.
//

import UIKit

class ComicsViewController: UIViewController {
    
    
    var items = 10
    
    @IBOutlet weak var comicsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        comicsTableView.register(UINib(nibName: "ComicsCell", bundle: nil), forCellReuseIdentifier: "ComicsCell")
        comicsTableView.dataSource = self
        comicsTableView.delegate = self
        
        
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

extension ComicsViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (comicsTableView.contentSize.height - 100)-scrollView.frame.size.height {
            print("+10")
            self.items += 10
            comicsTableView.reloadData()
        }
    }
}

extension ComicsViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComicsCell", for: indexPath) as! ComicsTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "listToDetail", sender: nil)
    }
    
    
}
