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

class SearchDisplayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    static let storyboardId = "SearchDisplayViewController"
    
    let recipients: [Recipient] = []
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.reuseId) as? SearchCell else {
            fatalError()
        }
        
        let recipient = recipients[indexPath.row]
        cell.nameLabel.text = recipient.fullName()
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
