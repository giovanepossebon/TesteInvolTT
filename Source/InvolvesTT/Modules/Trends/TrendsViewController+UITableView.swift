//
//  TrendsViewController+UITableView.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 28/08/17.
//  Copyright © 2017 Rafael Leandro. All rights reserved.
//

import UIKit

extension TrendsViewController: UITableViewDataSource, UITableViewDelegate{

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TrendsTableViewCell{
            cell.position = indexPath.row + 1
            cell.trend = data[indexPath.row].name
            return cell
        }

        
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
}
