//
//  CategoryViewController.swift
//  TodoList
//
//  Created by Slimn Srarena on 3/10/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class CategoryViewController: SwipeTableViewController {
    
    let realm = try! Realm()
    
    var categoryItem : Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70.0
        tableView.separatorStyle = .none
        loadCategories()
        
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        title = "ToDo List"
//
//        guard let originalColor = UIColor(hexString: "1D98F6") else { fatalError("Navigation controller not exist!") }
//        navigationController?.navigationBar.barTintColor = originalColor
//        navigationController?.navigationBar.tintColor = FlatSkyBlue()
//        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor :FlatWhite()]
//    }
    
    // MARK: - TableView Datasource

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categoryItem?.count ?? 1
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        if let category = categoryItem?[indexPath.row] {
            
            cell.textLabel?.text = category.name
            
            cell.backgroundColor = UIColor(hexString: category.color)
            
            if let color = UIColor(hexString: category.color) {

                cell.textLabel?.textColor = ContrastColorOf(color, returnFlat: true)
            }
        }
        
        return cell
    }
    
    
    // MARK: - TableView delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "gotoItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destination.selectedCategory = (categoryItem?[indexPath.row])!
        }
        
    }

    // MARK: - Data Manipulation Methods
    
    func loadCategories() {
        
        categoryItem = realm.objects(Category.self)
        
        tableView.reloadData()
    }
    
    func saveCategory(_ category : Category) {
        
        do {
            try realm.write {
                realm.add(category)
            }
            print("success")
        }
        catch {
            print(error)
        }
        self.tableView.reloadData()
    }
    
    //MARK: - Delete Swipe Cell
    override func updateModel(at indexPath: IndexPath) {
        if let deleteItem = self.categoryItem?[indexPath.row] {
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

    // MARK: - Add New Category
    @IBAction func addCategoryPressed(_ sender: UIBarButtonItem) {
        var titleTextField = UITextField()
        
        let alertController = UIAlertController(title: "Add New Todo List Category",
                                                message:"",
                                                preferredStyle: .alert)
        
        let addCategoryAction = UIAlertAction(title: "Add Category", style: .default) { (action) in
            
            let newCategory = Category()
            newCategory.name = titleTextField.text!
            newCategory.color = UIColor.randomFlat().hexValue()
            self.saveCategory(newCategory)
        }
        
        alertController.addTextField { (alertTexfield) in
            titleTextField = alertTexfield
        }
        alertController.addAction(addCategoryAction)
        present(alertController,
                animated: true,
                completion: nil)
    }
}
