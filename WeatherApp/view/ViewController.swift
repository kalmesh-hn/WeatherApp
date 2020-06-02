//
//  ViewController.swift
//  WeatherApp
//
//  Copyright © 2020 Kalmesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var tableView: UITableView!
    private var viewModel: WeatherViewModelProtocol
    private let activityIndicator = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self

        activityIndicator.center = view.center
        view.addSubview(activityIndicator)

        // observing datasource changes
        _ = viewModel.weatherDetails.observeNext {[weak self] value in
            self?.tableView.reloadData()
        }

        // observing for any alert to be shown on screen
        _ = viewModel.showAlert.observeNext {[weak self] alert in
            guard let self = self, let alert = alert else { return }
            self.present(alert, animated: true)
        }
        
        // show/hide loader
        _ = viewModel.showLoader.observeNext(with: {[weak self] value in
            if value {
                self?.activityIndicator.startAnimating()
            } else {
                self?.activityIndicator.stopAnimating()
            }
        })

        //tell viewModel that screen is loaded now
        viewModel.viewLoaded()
        self.title = "Weather"
    }
    
    init(viewModel: WeatherViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = WeatherViewModel()
        super.init(coder: coder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.viewModel = WeatherViewModel()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    static func instantiate(viewModel: WeatherViewModelProtocol = WeatherViewModel()) -> ViewController {
        let viewController: ViewController = ViewController(nibName: "ViewController", bundle: nil)
        viewController.viewModel = viewModel
        return viewController
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.weatherDetails.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        let weatherDetail = viewModel.weatherDetails.value?[indexPath.row]
        cell.textLabel?.text = weatherDetail?.detailKey
        cell.detailTextLabel?.text = weatherDetail?.detailValue
        return cell
    }
}
