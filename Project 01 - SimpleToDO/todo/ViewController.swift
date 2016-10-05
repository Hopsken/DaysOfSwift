//
//  ViewController.swift
//  todo
//
//  Created by shaowei on 2016/10/3.
//  Copyright © 2016年 shaowei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var items: [String] = ["Welcome😉"]
    
    @IBOutlet weak var listTableView: UITableView!

    @IBAction func addIten(_ sender: AnyObject) {
        alert()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listItem") as! ItemTableViewCell
        cell.itemLable.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func alert() {
        let alert = UIAlertController(title: "添加新项目", message: "", preferredStyle: .alert)
        
        alert.addTextField{
            (textfield) in
            textfield.placeholder = "Enter your item name"
        }
        
        let add = UIAlertAction(title: "Add", style: .default ) {
            (action) in
            let textfield = alert.textFields![0] 
            self.items.append(textfield.text!)
            self.listTableView.reloadData()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) {
            (alert) in
            
            print("Hi")
        }
        
        alert.addAction(add)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

