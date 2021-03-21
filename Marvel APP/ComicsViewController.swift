//
//  ComicsViewController.swift
//  Marvel APP
//
//  Created by Raphael Freschi on 21/03/21.
//

import UIKit

class ComicsViewController: UIViewController {

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
    
}

extension ComicsViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComicsCell", for: indexPath) as! ComicsTableViewCell
        
        return cell
    }
    
    
}
