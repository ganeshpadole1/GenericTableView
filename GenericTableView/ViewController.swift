//
//  ViewController.swift
//  GenericTableView
//
//  Created by ganesh padole on 14/11/21.
//

import UIKit

class ViewController: UIViewController {

    var reusableTableView: GenericTableView<String, UITableViewCell>!
    var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { _ in
            self.items = Array(repeating: "Item", count: 10)
            self.reusableTableView.reload(data: self.items)
        }
    
        setupTable()
    }

    func setupTable() {
        reusableTableView = GenericTableView(frame: view.frame, items: items, config: { (item, cell) in
            cell.textLabel?.text = item
        }, selectHandler: { item in
            print(item)
        })
        
        view.addSubview(reusableTableView)
    }

}

