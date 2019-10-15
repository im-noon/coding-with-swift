//
//  TodoListViewController.swift
//  TodoList
//
//  Created by Slimn Srarena on 2/10/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class TodoListViewController: SwipeTableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    var todoListItem : Results<Item>?

    let realm = try! Realm()
    
    var selectedCategory : Category? {
        didSet {
            loadItems()
        }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        
        if let hexColor = selectedCategory?.color {
            navigationController?.navigationBar.barTintColor = UIColor(hexString: hexColor)
        }
        //loadItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let hexColor = selectedCategory?.color {

            title = selectedCategory!.name
            updateNavBar(withColorHexCode: hexColor)

        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        updateNavBar(withColorHexCode: "1D98F6")
    }

    // MARK: - Update Nav Bar
    func updateNavBar(withColorHexCode colorHexCode : String) {
        guard let navBar = navigationController?.navigationBar else { fatalError("Navigation controller not exist!")}
        
        if let navBarColor = UIColor(hexString: colorHexCode) {
            
            navBar.barTintColor = navBarColor
            
            navBar.tintColor = ContrastColorOf(navBarColor, returnFlat: true)
            
            navBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor :ContrastColorOf(navBarColor, returnFlat: true)]
            
            searchBar.barTintColor = navBarColor
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoListItem?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        if let item = todoListItem?[indexPath.row] {
            
            cell.textLabel?.text = item.title
            
            if let color = UIColor(hexString: selectedCategory!.color)?.darken(byPercentage: CGFloat(indexPath.row)/CGFloat(todoListItem!.count)) {
                cell.backgroundColor = color
                cell.textLabel?.textColor = ContrastColorOf(color, returnFlat: true)
            }
            
            cell.accessoryType = item.done ? .checkmark : .none
        }
        else {
            cell.textLabel?.text = "No Item Added"
        }
        
        return cell
    }

    
    // MARK: - TableView delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let item = todoListItem?[indexPath.row] {
            do {
                try realm.write {
                    item.done = !item.done
                }
            } catch {
                print("Error saving done status")
            }
        }

        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Data Manipulation Methods
    func loadItems() {
        
        todoListItem = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        
        tableView.reloadData()
    }
    
    //MARK: - Delete Swipe Cell
    override func updateModel(at indexPath: IndexPath) {
        if let deleteItem = self.todoListItem?[indexPath.row] {
            do {
                try realm.write {
                    realm.delete(deleteItem)
                }
                print("success")
            }
            catch {
                print(error)
            }
            self.tableView.reloadData()
        }
    }
    

    // MARK: - Add New Item
    @IBAction func addItemPressed(_ sender: UIBarButtonItem) {
        
        var titleTextField = UITextField()

        let alertController = UIAlertController(title: "Add New Todo List Item",
                                                message:"",
                                                preferredStyle: .alert)
        
        let addItemAction = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            if let currentCategory = self.selectedCategory {
                do {
                    try self.realm.write {
                        let newItem = Item()
                        
                        newItem.title = titleTextField.text!
                        newItem.dateCreated = Date()
                        currentCategory.items.append(newItem)
                    }
                }
                catch {
                    print("Error saving new item, \(error)")
                }
            }
            
            self.tableView.reloadData()
        }
        
        alertController.addTextField { (alertTexfield) in
            titleTextField = alertTexfield
        }
        alertController.addAction(addItemAction)
        present(alertController,
                animated: true,
                completion: nil)

    }

}

// MARK: - Searchbar Method
extension TodoListViewController: UISearchBarDelegate {
//    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        todoListItem = todoListItem?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "title", ascending: true)
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadItems()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text!)
    }
//    
}
