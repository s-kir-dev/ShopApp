//
//  Helper.swift
//  Shop
//
//  Created by Кирилл Сысоев on 28.01.2025.
//

import Foundation
import UIKit

let storyboard = UIStoryboard(name: "Main", bundle: nil)
let screensController = storyboard.instantiateViewController(withIdentifier: "TabBar") as! UITabBarController
let onboardingVC = storyboard.instantiateViewController(withIdentifier: "OnboardingVC") as! OnboardingViewController
let firstVC = storyboard.instantiateViewController(withIdentifier: "FirstVC") as! UIViewController

enum Category: String, Codable {
    case all = "All"
    case outdoor = "Outdoor"
    case tennis = "Tennis"
    case running = "Running"
}

struct Product: Codable {
    let name: String
    let image: String
    let isFavorite: Bool
    let category: Category
    let price: Double
}

struct Products {
    static let outdoor: [Product] = [
        Product(name: "Nike Air Force 1", image: "product", isFavorite: false, category: .outdoor, price: 1000.00),
        Product(name: "Nike Air Force 2", image: "product", isFavorite: false, category: .outdoor, price: 1100.00),
        Product(name: "Nike Air Force 3", image: "product", isFavorite: false, category: .outdoor, price: 1200.00),
        Product(name: "Nike Air Force 4", image: "product", isFavorite: false, category: .outdoor, price: 1300.00)
    ]
    
    static let tennis: [Product] = [
        Product(name: "Asics Gel-Kayano 28", image: "product", isFavorite: false, category: .tennis, price: 1150.00),
        Product(name: "Asics TeknoFlyer", image: "product", isFavorite: false, category: .tennis, price: 1280.00),
        Product(name: "Nike Tech Fit", image: "product", isFavorite: false, category: .tennis, price: 1000.00),
        Product(name: "Tennis Snickers", image: "product", isFavorite: false, category: .tennis, price: 1300.00)
    ]
    
    static let running: [Product] = [
        Product(name: "Nike Air", image: "product", isFavorite: false, category: .running, price: 1050.00),
        Product(name: "Adidas Ultraboost", image: "product", isFavorite: false, category: .running, price: 1100.00),
        Product(name: "Puma Suede", image: "product", isFavorite: false, category: .running, price: 1150.00),
        Product(name: "Reebok Classic", image: "product", isFavorite: false, category: .running, price: 1200.00)
    ]
}

//var products = Products()
