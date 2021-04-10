//
//  MyMealTableViewController.swift
//  A2-iOSPortfolioTasks
//
//  Created by user176152 on 4/8/21.
//

import UIKit

class MyMealTableViewController: UITableViewController, AddMealDelegate {
    let SECTION_MEAL = 0
    let SECTION_COUNT = 1
    
    let CELL_MEAL = "myMealCell"
    let CELL_COUNT = "myMealSizeCell"
    
    var myMeals: [Meal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testMeal()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func testMeal() {
        let ingMeas1 = IngredientMeasurement(name: "vanila", quantity: "1 tsp")
        let ingMeas2 = IngredientMeasurement(name: "bd", quantity: "7 tsp")
        let ingMeas3 = IngredientMeasurement(name: "kjkg", quantity: "1/2 tsp")
        
        let ings1 = [ingMeas1,ingMeas2,ingMeas3]
        let ings2 = [ingMeas2,ingMeas1,ingMeas3]
        let ings3 = [ingMeas3,ingMeas2,ingMeas1]
        
        myMeals.append(Meal(name: "test2", instructions: "fjowerhgfjhuiwhouhvwbjguiw gowij gfwrtoipjg gtrwoijgihp0394 t58902ujogv 34t209ujgvw 435t980pgw t49028- g3408-23 425n3opugv8fern ergiopu8  n543 w-[0v/s;er fjh0-w4", ingredients: ings1))
        myMeals.append(Meal(name: "test1", instructions: "9028- g3408-23 425n3opugv8fern ergiopu8  n543 w-[0v/s;er fjh0-w4", ingredients: ings2))
        myMeals.append(Meal(name: "test3", instructions: "jogv 34t209ujgvw 435t980pgw t49028- g3408-23 425n3opugv8fern ergiopu8  n543 w-[0v/s;er fjh0-w4", ingredients: ings3))
    }
    
    // MARK: - Delegate
    func addMeal(_ newMeal: Meal) -> Bool {
        tableView.performBatchUpdates({
            myMeals.append(newMeal)
            tableView.insertRows(at: [IndexPath(row: myMeals.count - 1, section: SECTION_MEAL)], with: .automatic)
            tableView.reloadSections([SECTION_COUNT], with: .automatic)
        }, completion: nil)
        
        return true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
            case SECTION_MEAL:
                return myMeals.count
            case SECTION_COUNT:
                return 1
            default:
                return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == SECTION_MEAL {
            let mealCell = tableView.dequeueReusableCell(withIdentifier: CELL_MEAL, for: indexPath)
            let meal = myMeals[indexPath.row]

            mealCell.textLabel?.text = meal.name
            mealCell.detailTextLabel?.text = meal.instructions
            return mealCell
        }

        let mealCountCell = tableView.dequeueReusableCell(withIdentifier: CELL_COUNT, for: indexPath)
            as! MealCountTableViewCell
        
        if myMeals.isEmpty {
            mealCountCell.mealCountLabel?.text = "Click + to add new meal"
        }
        else {
            mealCountCell.mealCountLabel?.text = "\(myMeals.count) Stored Meal"
        }
                
        return mealCountCell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        if indexPath.section == SECTION_MEAL {
            return true
        }
        
        return false
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete && indexPath.section == SECTION_MEAL {
            // Delete the row from the data source
            tableView.performBatchUpdates({
                self.myMeals.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .fade)
                self.tableView.reloadSections([SECTION_COUNT], with: .automatic)
            }, completion: nil)
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "mealDetailSegue" {
            let createMealTableViewController = segue.destination as! CreateMealTableViewController
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                createMealTableViewController.meal = myMeals[selectedIndexPath.row]
            }
        }
    }
}
