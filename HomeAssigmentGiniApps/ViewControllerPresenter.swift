//
//  ViewControllerPresenter.swift
//  HomeAssigmentGiniApps
//
//  Created by Dominika Poleshyck on 17.01.22.
//

import Foundation
import Alamofire

protocol ViewControllerPesenterProtocol {
    func viewDidLoad()
    var view: ViewControllerProtocol? { get set }
    func digit(for indexPath: IndexPath) -> Int?
    func numberOfElement() -> Int
    func twoSums(_ array: [Int], _ target: Int) -> [Int]
}

class ViewControllerPesenter: ViewControllerPesenterProtocol {
    let numbersURL = "https://pastebin.com/raw/8wJzytQX"
    let param = ["Numbers": 1]
    let data = Data()
    var size: CGFloat = 1
    var view: ViewControllerProtocol?
    private var elements: [Int] = []
    func viewDidLoad() {
                AF.request(numbersURL).responseJSON { responce in
                    print(responce)
                    let numbersValues = responce.value
                    self.elements = numbersValues as? [Int] ?? []
                    self.view?.reloadData()
                }
                if data != nil {
                    let dictionary = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String : Any]
                }
        getNumbers(url: numbersURL, parametres: param)
    }
    
    func getNumbers(url: String, parametres: [String: Int]) {
        AF.request(numbersURL, method: .get, parameters: parametres).responseJSON { responce in
            print(responce)
        }
    }
    
    func numberOfElement() -> Int {
        return elements.count
    }
    
    func digit(for indexPath: IndexPath) -> Int? {
        return elements[indexPath.row]
    }
    
    func twoSums(_ array: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        var resultArray : [Int] = []
        for (i, j) in array.enumerated() {
            if let index = dict[target-j] {
                resultArray.append(index)
                resultArray.append(i)
                return resultArray
            }
            dict[j] = i
        }
        return resultArray
    }
}
