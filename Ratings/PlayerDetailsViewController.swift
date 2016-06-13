//
//  PlayerDetailsViewController.swift
//  Ratings
//
//  Created by JING SHEN on 11/06/2016.
//  Copyright © 2016 JING SHEN. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UITableViewController {

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    var player:Player?
    
    var game:String = "Chess" {
        didSet {
            detailLabel.text? = game
        }
    }
    
    
    @IBAction func unwindWithSelectedGame(segue:UIStoryboardSegue) {
        if let gamePickerViewController = segue.sourceViewController as? GamePickerViewController,
            selectedGame = gamePickerViewController.selectedGame {
            game = selectedGame
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "savePlayerDetail" {
            player = Player(name: nameTextField.text!, game: game, rating: 1)
        }
        if segue.identifier == "PickGame" {
            if let gamePickerViewController = segue.destinationViewController as? GamePickerViewController {
                gamePickerViewController.selectedGame = game
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        print("init PlayerDetailsViewController", terminator: "")
        super.init(coder: aDecoder)
    }
    
    deinit {
        print("deinit PlayerDetailsViewController", terminator: "")
    }
    // MARK: - Table view data source

    
}
