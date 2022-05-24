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
    var calendarClass = CalendarClass()
    
    @IBOutlet weak var contentDataView: UIView!
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
        return calendarClass.classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardClassView",for: indexPath) as! CardClassView
        cell.configCard(classes: calendarClass.classes[indexPath.row])
        return cell
    }
    
}

extension HomeDetailView: UITabBarDelegate {
    
}

extension HomeDetailView: HomeDetailViewProtocol {
    // TODO: implement view output methods
    
    func presenterCallBackData(classSchedule: [CalendarClass], status: Bool) {
        
        if !status {
            dismiss(animated: true)
        }
        print(status)
        print(classSchedule)
        calendarClass = classSchedule.first ?? CalendarClass()
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
