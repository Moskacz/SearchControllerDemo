//
//  File.swift
//  SearchControllerDemo
//
//  Created by Michał Moskała on 30.06.2017.
//  Copyright © 2017 Michal Moskala. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {
    
    static let reuseId = "SearchCell"
    @IBOutlet weak var nameLabel: UILabel!
}

class SearchDisplayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    
    static let storyboardId = "SearchDisplayViewController"
    @IBOutlet weak var tableView: UITableView!
    
    var recipients: [Recipient] = []
    private var filteredRecipients: [Recipient] = []
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredRecipients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.reuseId) as? SearchCell else {
            fatalError()
        }
        
        let recipient = filteredRecipients[indexPath.row]
        cell.nameLabel.text = recipient.fullName()
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // MARK: UISearchResultsUpdating
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {
            return
        }
        
        filteredRecipients = recipients.filter { (recipient: Recipient) -> Bool in
            let searchableName = recipient.fullName().replacingOccurrences(of: " ", with: "").lowercased()
            return searchableName.contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
}
