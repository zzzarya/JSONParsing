//
//  ViewController.swift
//  JSONParsingHW
//
//  Created by Антон Заричный on 17.09.2022.
//

import UIKit

let jsonInfo = "https://rickandmortyapi.com/api"

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchInfo()
    }
}

private func fetchInfo() {
    guard let url = URL(string: jsonInfo) else { return }
    
    URLSession.shared.dataTask(with: url) { data, _, error in
        guard let data = data else {
            print(error?.localizedDescription ?? "No error description")
            return
        }
        
        let jsonDecoder = JSONDecoder()
        
        do {
            let jsonInfo = try jsonDecoder.decode(Info.self, from: data)
            print(jsonInfo)
        } catch {
            print(error.localizedDescription)
        }
        
    }.resume()
}

