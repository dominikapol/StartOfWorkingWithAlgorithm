//
//  RedCell.swift
//  HomeAssigmentGiniApps
//
//  Created by Dominika Poleshyck on 17.01.22.
//

import Foundation
import UIKit

class RedCell: UICollectionViewCell {
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func changeNumberOfRedCell(number: String) {
        numberLabel.text = String(number)
    }
}
