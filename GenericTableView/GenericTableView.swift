//
//  GenericTableView.swift
//  GenericTableView
//
//  Created by ganesh padole on 14/11/21.
//

import UIKit

class GenericTableView<Item, Cell: UITableViewCell>: UITableView, UITableViewDelegate, UITableViewDataSource{
    
    var items: [Item]!
    var config: (Item, Cell) -> ()
    var selectHandler: (Item) -> ()
    
    init(frame: CGRect,items: [Item], config: @escaping (Item, Cell) -> (), selectHandler: @escaping (Item) -> ()) {
        self.items = items
        self.config = config
        self.selectHandler = selectHandler
        super.init(frame: frame, style: .plain)
        
        self.delegate = self
        self.dataSource = self
        self.register(Cell.self, forCellReuseIdentifier: "Cell")
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        let item = items[indexPath.row]
        config(item,cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        selectHandler(item)
    }
}

extension GenericTableView {
    func reload(data items: [Item]) {
        self.items = items
        self.reloadData()
    }
}
