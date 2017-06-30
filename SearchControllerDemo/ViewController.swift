//
//  ViewController.swift
//  SearchControllerDemo
//
//  Created by Michał Moskała on 30.06.2017.
//  Copyright © 2017 Michal Moskala. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }


    @IBOutlet private weak var tableView: UITableView!
    
    private let recipients: [Recipient] = [Recipient(firstName: "Jan", lastName: "Kowalski"),
                                           Recipient(firstName: "Piotr", lastName: "Nowak"),
                                           Recipient(firstName: "Mateusz", lastName: "Kuchar"),
                                           Recipient(firstName: "Pawel", lastName: "Szpila"),
                                           Recipient(firstName: "Lukasz", lastName: "Olsen"),
                                           Recipient(firstName: "Michal", lastName: "Kuchar"),
                                           Recipient(firstName: "Bartosz", lastName: "Szpila"),
                                           Recipient(firstName: "Malgorzata", lastName: "Kowalski"),
                                           Recipient(firstName: "Sylwia", lastName: "Nowak"),
                                           Recipient(firstName: "Victoria", lastName: "Boska"),
                                           Recipient(firstName: "Iza", lastName: "Aftyka")]
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecipientCell.reuseId) as? RecipientCell else {
            fatalError()
        }
        
        let recipient = recipients[indexPath.row]
        cell.recipientNameLabel.text = recipient.fullName()
        return cell
    }

}

