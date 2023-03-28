//
//  InfoViewController.swift
//  Navigation
//
//  Created by ln on 18.08.2022.
//

import UIKit

class InfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        button.setTitle("Показать allert", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var firstJSONLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var secondJSONLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .grouped)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var residents: [String] = []
    private lazy var residentsNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemMint
        setupView()
        firstJSON()
        secondJSON()
    }
    
    @objc private func didTapButton() {
        
        let alertController = UIAlertController(title: "lol", message: "kek", preferredStyle: .alert)
        let firstAction = UIAlertAction(title: "Привет", style: .default) { _ in
            print("Privet")
        }
        let secondAction = UIAlertAction(title: "Пока", style: .cancel) { _ in
            print("Pokasiki")
        }
        alertController.addAction(firstAction)
        alertController.addAction(secondAction)
        self.present(alertController, animated: true)
    }
    
    private func setupView() {
        
        self.view.addSubview(self.button)
        self.view.addSubview(self.firstJSONLabel)
        self.view.addSubview(self.secondJSONLabel)
        self.view.addSubview(self.tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 200),
            
            firstJSONLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            firstJSONLabel.heightAnchor.constraint(equalToConstant: 50),
            firstJSONLabel.widthAnchor.constraint(equalToConstant: 200),
            firstJSONLabel.leadingAnchor.constraint(equalTo: button.leadingAnchor),
            
            secondJSONLabel.topAnchor.constraint(equalTo: firstJSONLabel.bottomAnchor, constant: 20),
            secondJSONLabel.heightAnchor.constraint(equalToConstant: 50),
            secondJSONLabel.widthAnchor.constraint(equalToConstant: 200),
            secondJSONLabel.leadingAnchor.constraint(equalTo: button.leadingAnchor),
            
            tableView.topAnchor.constraint(equalTo: secondJSONLabel.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    private func firstJSON() {
        
        if let url = URL(string: "https://jsonplaceholder.typicode.com/todos/\(1)") {
    
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let unwrappedData = data {
                    
                    do {
                        if let dictionary = try JSONSerialization.jsonObject(with: unwrappedData) as? [String: Any] {
    
                            DispatchQueue.main.async {
                                if let title = dictionary["title"] as? String {
                                    self.firstJSONLabel.text = "   " + title
                                }
                            }
                        }
                    } catch let error {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
    
    private func secondJSON() {
        
        if let url = URL(string: "https://swapi.dev/api/planets/1") {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let unwrappedData = data {
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let planet = try decoder.decode(Planet.self, from: unwrappedData)

                        DispatchQueue.main.async {
                            self.secondJSONLabel.text = "   Orbital period: " + planet.orbitalPeriod
                        }
                        self.residents = planet.residents
                        self.installResidentsNames()
                    }
                    catch let error {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
    
    func installResidentsNames() {
        let group = DispatchGroup()
        for resident in residents {
            if let url = URL(string: resident) {
                group.enter()
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    if let unwrappedData = data {
                        do {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let resident = try decoder.decode(Resident.self, from: unwrappedData)
                            self.residentsNames.append(resident.name)
                            group.leave()
                        } catch let error {
                            print(error)
                        }
                    }
                }
                task.resume()
            }
        }
        group.notify(queue: .main) {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return residents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        cell.textLabel?.text = self.residentsNames[indexPath.row]
        return cell
    }
}


class TableViewCell: UITableViewCell { }

