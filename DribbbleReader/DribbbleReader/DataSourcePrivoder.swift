//
//  DataSourcePrivoder.swift
//  DribbbleReader
//
//  Created by Jeff on 08/01/2017.
//  Copyright © 2017 Jeff. All rights reserved.
//

import UIKit

protocol DataSourcePrivoder: class {
    associatedtype CellConfigureClosure

    var items: [Any]? { get set }
    var cellIdentifier: String { get }
    var cellConfigureClosure: CellConfigureClosure { get }
    
    init(cellIdentifier: String, cellConfigureClosure: CellConfigureClosure)
    init(items: [Any]?, cellIdentifier: String, cellConfigureClosure: CellConfigureClosure)
    
    func configureCell(identifier: String, closure: CellConfigureClosure)
    
    func item(at indexPath: IndexPath) -> Any?
}


//class TableViewDataSource<Cell, Item>: DataSourcePrivoder {
//
//    typealias CellConfigureClosure = (_ cell: Cell, _ item: Item, _ indexPath: IndexPath) -> ()
//    
//    var items: [Any]?
//    
//    var cellConfigureClosure: CellConfigureClosure
//    
//    var cellIdentifier: String = ""
//    
//    init() {
//        
//    }
//    
//    convenience required init(cellIdentifier: String, cellConfigureClosure: @escaping (Cell, Item, IndexPath) -> ()) {
//        self.init(items: nil, cellIdentifier: cellIdentifier, cellConfigureClosure: cellConfigureClosure)
//    }
//
//    convenience required init(items: [Any]? = nil, cellIdentifier: String, cellConfigureClosure: @escaping (Cell, Item, IndexPath) -> ()) {
//        self.items = items
//        self.cellIdentifier = cellIdentifier
//        self.cellConfigureClosure = cellConfigureClosure
//    }
//    
//    func item(at indexPath: IndexPath) -> Any? {
//        return items?[indexPath.row]
//    }
//    
//    func configureCell(identifier: String, closure: @escaping (Cell, Item, IndexPath) -> ()) {
//        cellIdentifier = identifier
//        cellConfigureClosure = closure
//    }
//    
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return items == nil ? 0 : items!.count
//////        return items?.count
////    }
//}







































