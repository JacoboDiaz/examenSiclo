//
//  HomeDetailView.swift
//  examenSiclo
//
//  Created by Jacobo Emmanuel Diaz Rodriguez on 22/05/22.
//  
//

import Foundation
import UIKit

class HomeDetailView: UIViewController {

    // MARK: Properties
    var presenter: HomeDetailPresenterProtocol?
    @IBOutlet weak var contentDataView: UIView!
    var countCell = 0
    @IBOutlet weak var classesTbl: UITableView! {
        didSet{
            classesTbl.register(UINib(nibName: "CardClass", bundle: nil), forCellReuseIdentifier: "cardClassView")
        }
    }
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        contentDataView.isHidden = true
        presenter?.viewDidLoad()
    }
}

extension HomeDetailView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardClassView",for: indexPath) as! CardClassView
        return cell
    }
    
    
}

extension HomeDetailView: UITabBarDelegate {
    
}

extension HomeDetailView: HomeDetailViewProtocol {
    // TODO: implement view output methods
    
    func presenterCallBackData(classSchedule: [ClassSchedule], status: Bool) {
        print(status)
        print(classSchedule)
        countCell = 3
        classesTbl.reloadData()
        contentDataView.isHidden = false
        hidenLoadingView()
    }
    
    func showLoadingView() {
        LoadingView.shared.showActivityIndicator(uiView: self.view)
    }
    
    func hidenLoadingView() {
        LoadingView.shared.hideActivityIndicator(uiView: self.view)
    }
}
