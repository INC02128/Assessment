//
//  SecondViewController.swift
//  API calling and collectionView
//
//  Created by Amit Kumar Sahu on 10/04/23.
//

import UIKit





    class SecondViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
        
        @IBOutlet weak var tableView: UITableView!
        var apiData : [PostModel] = []
        override func viewDidLoad() {
            super.viewDidLoad()
            self.tableView.delegate = self
            self.tableView.dataSource = self
            register()
            fetchData()
        }
        func register(){
            tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
            self.tableView.separatorColor = .blue
            self.tableView.separatorStyle = .singleLine
        }
        
        func fetchData(){
            let urlString = "https://jsonplaceholder.typicode.com/posts"
            let urlSession = URLSession(configuration: .default)

            guard let url = URL(string: urlString) else{
                return
            }
            let urlRequest = URLRequest(url: url)
            let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
                guard error == nil else{
                    return
                }
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode,statusCode == 200 else {
                    return
                }
                if let data = data
                {
                    do{
                        let responseData = try JSONDecoder().decode([PostModel].self,from: data)
                        DispatchQueue.main.async
                        {
                            self.apiData = responseData
                            self.tableView.reloadData()
                        }
                    }
                    catch(let JsonParseError)
                    {
                        print(JsonParseError.localizedDescription)
                    }
                }
            }
            dataTask.resume()
            tableView.reloadData()
        }
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return apiData.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
            cell.postId.text = "\(apiData[indexPath.row].id ?? 0)"
            cell.postTitle.text = apiData[indexPath.row].title ?? ""
            cell.postText.text = apiData[indexPath.row].body ?? ""
            return cell
        }
        
    }

