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
    
    let cellName = "HotelTableViewCell"
    
    var editingHotelIndex: Int?
    
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
        //        hotelsListTableView.rowHeight = UITableView.automaticDimension
        //        hotelsListTableView.estimatedRowHeight = 150
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HotelDetailsFormViewSegueAdd", let detailsVC = segue.destination as? HotelDetailsFormViewController {
            detailsVC.injectDependencies(viewModel: viewModel, pageJob: .add, indexOfHotel: nil, delegate: self)
        } else if segue.identifier == "HotelDetailsFormViewSegueEdit", let detailsVC = segue.destination as? HotelDetailsFormViewController, let index = self.editingHotelIndex {
            detailsVC.injectDependencies(viewModel: viewModel ,pageJob: .edit, indexOfHotel: index, delegate: self)
        }
    }
    
}

extension HotelsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as? HotelTableViewCell {
            if let hotelViewModel = viewModel.hotelViewModel(at: indexPath.row) {
                cell.configure(hotelViewModel: hotelViewModel, indexPath: indexPath)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [
            makeEditContextualAction(forRowAt: indexPath), makeDeleteContextualAction(forRowAt: indexPath)
        ])
    }
    
    //MARK: - Contextual Actions
    private func makeDeleteContextualAction(forRowAt indexPath: IndexPath) -> UIContextualAction {
        return UIContextualAction(style: .destructive, title: "Delete") { (action, swipeButtonView, completion) in
            self.viewModel.removeHotel(at: indexPath.row)
            completion(true)
        }
    }
    
    private func makeEditContextualAction(forRowAt indexPath: IndexPath) -> UIContextualAction {
        return UIContextualAction(style: .normal, title: "Edit") { (action, swipeButtonView, completion) in
            swipeButtonView.addCardLook()
            swipeButtonView.backgroundColor = UIColor.themeColor(type: .light)
            self.editingHotelIndex = indexPath.row
            self.performSegue(withIdentifier: "HotelDetailsFormViewSegueEdit", sender: self)
            completion(true)
        }
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
