//
//  ProductCollectionViewCell.swift
//  Shop
//
//  Created by Кирилл Сысоев on 28.01.2025.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var addToFavoriteButton: UIButton!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productCategory: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var addToCart: UIButton!
}
