//
//  ViewController.swift
//  HomeAssigmentGiniApps
//
//  Created by Dominika Poleshyck on 17.01.22.
//

// 1) Писать на MVP ✅
// 2) Создать UICollectionView ✅
// 3) Создать кастомные ячейки: красная ячейка высотой 100, оранжевые высотой 50 ✅
// 4) Создать запрос на получение массива Int -> presenter ✅
// 5) Развернуть словарь с массивом словарей
// 6) Создать функцию для фильтрации массива -> presenter ✅
// 7) Подставить значения в ячейки
// 8) Сделать .reload
// dictionary: { ключ: значение([ {ключ:зачение}, {ключ:зачение}, {ключ:зачение}...  ]) }


import UIKit

protocol ViewControllerProtocol: AnyObject {
    func reloadData()
}

class ViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    var presenter: ViewControllerPesenterProtocol = ViewControllerPesenter()
    var size: CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.view = self
        presenter.viewDidLoad()
        
        self.collectionView.register(UINib(nibName: "RedCell", bundle: nil), forCellWithReuseIdentifier: "RedCell")
        self.collectionView.register(UINib(nibName: "OrangeCell", bundle: nil), forCellWithReuseIdentifier: "OrangeCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: size)
        collectionView.collectionViewLayout = layout
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ViewController: ViewControllerProtocol {
    func reloadData() {
        collectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        return presenter.numberOfElement()
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let orangeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrangeCell", for: indexPath) as? OrangeCell else { return UICollectionViewCell() }
        guard let redCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RedCell", for: indexPath) as? RedCell else { return UICollectionViewCell() }
        return orangeCell // redCell 
    }
    
}


