//
//  MainViewController.swift
//  Shop
//
//  Created by Кирилл Сысоев on 28.01.2025.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var filterAll: UIButton!
    @IBOutlet weak var filterOutdoor: UIButton!
    @IBOutlet weak var filterTennis: UIButton!
    @IBOutlet weak var filterRunning: UIButton!
    
    var selectedType: Category = .all
    var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self //делегируем источник данных для заполнения ячеек
        
        products.append(contentsOf: Products.outdoor) //заполняем массив товаров
        products.append(contentsOf: Products.tennis)
        products.append(contentsOf: Products.running)
        
        collectionView.reloadData() // обновляем данные коллекции
        
        filterAll.addTarget(self, action: #selector(filterAllButtonTapped), for: .touchUpInside) // добавляем действие по нажатию на кнопку
        filterOutdoor.addTarget(self, action: #selector(filterOutdoorButtonTapped), for: .touchUpInside)
        filterTennis.addTarget(self, action: #selector(filterTennisButtonTapped), for: .touchUpInside)
        filterRunning.addTarget(self, action: #selector(filerRunningButtonTapped), for: .touchUpInside)
    }
    
    @objc func filterAllButtonTapped() { // фильтрация по всем продуктам
        products.removeAll()
        products.append(contentsOf: Products.outdoor)
        products.append(contentsOf: Products.tennis)
        products.append(contentsOf: Products.running)
        collectionView.setContentOffset(.zero, animated: true)
        selectedType = .all
        collectionView.reloadData()
        print("Фильтр все \(products.count)")
    }
    
    @objc func filterOutdoorButtonTapped() { // фильтрация по типу аутдор
        products.removeAll()
        products = Products.outdoor
        collectionView.setContentOffset(.zero, animated: true)
        selectedType = .outdoor
        collectionView.reloadData()
        print("Фильтр аутдор \(products.count)")
    }

    @objc func filterTennisButtonTapped() { // филтрация по типу теннис
        products.removeAll()
        products = Products.tennis
        collectionView.setContentOffset(.zero, animated: true)
        selectedType = .tennis
        collectionView.reloadData()
        print("Фильтр теннис \(products.count)")
    }
    
    @objc func filerRunningButtonTapped() { // фильтрация по типу беговые
        products.removeAll()
        products = Products.running
        collectionView.setContentOffset(.zero, animated: true)
        selectedType = .running
        collectionView.reloadData()
        print("Фильтр бег \(products.count)")
    }
}


extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { // задает количество ячеек
        print("\(products.count)")
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { // создает и заполняет ячейку данными
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCollectionViewCell
        
        let product: Product = products[indexPath.row]
        
        cell.layer.cornerRadius = 10
        cell.productImage.image = UIImage(named: product.image)
        cell.productPrice.text = "\(product.price)₽"
        cell.productName.text = product.name
        cell.productCategory.text = product.category.rawValue
        cell.addToFavoriteButton.backgroundColor = product.isFavorite ? UIColor.red : UIColor.systemGray5
        
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize { // задает размеры ячейки
        return CGSize(width: 130, height: 178)
    }
}
