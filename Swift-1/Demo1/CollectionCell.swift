//
//  CollectionCell.swift
//  Demo1
//
//  Created by WJ on 16/12/21.
//  Copyright © 2016年 WJ. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {

    @IBOutlet var lbTest: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
//    func init(<#parameters#>) -> <#return type#> {
//        <#function body#>
//    }
    
    func setCellInfo(test: String) -> () {
        lbTest.text = test
        
    }

}
