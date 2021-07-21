//
//  HotelsListViewController.swift
//  MyHotels
//
//  Created by Jeevan on 21/07/21.
//

import UIKit

class HotelsListViewController: BaseViewController {

    @IBOutlet weak var hotelsListTableView: UITableView!
    
    var viewModel: HotelsListViewModel = HotelsListViewModel()
    
    let cellName = String(describing: HotelTableViewCell.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configure(pageTitle: "Hotels")
        configureTableView()
        bindViewModel()
    }
    
    private func configureTableView() {
        hotelsListTableView.dataSource = self
        hotelsListTableView.delegate = self
        let nib = UINib(nibName: cellName, bundle: Bundle.main)
        hotelsListTableView.register(nib, forCellReuseIdentifier: cellName)
    }
    
    private func bindViewModel() {
        viewModel.reloadUI = {
            DispatchQueue.main.async {
                self.hotelsListTableView.reloadData()
            }
        }
    }

}

extension HotelsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as? HotelTableViewCell {
            if let hotel = viewModel.hotel(at: indexPath.row) {
                cell.configure(hotel: hotel, indexPath: indexPath)
            }
        }
        return UITableViewCell()
    }
}
extension HotelsListViewController: HotelUpdates {
    func addNewHotel(hotel: Hotel) {
        viewModel.addNewHotel(hotel: hotel)
    }
    
    func updateHotel(hotel: Hotel, at index: Int) {
        viewModel.updateHotel(hotel: hotel, at: index)
    }
}
