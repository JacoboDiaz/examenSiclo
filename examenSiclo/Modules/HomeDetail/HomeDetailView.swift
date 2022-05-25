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
    var calendarClassCards = CalendarClass()
    var calendarClassDate = [CalendarClass]()
    var classSchedule = [CalendarClass]()
    
    @IBOutlet weak var contentDataView: UIView!
    @IBOutlet weak var classesTbl: UITableView! {
        didSet{
            classesTbl.register(UINib(nibName: "CardClass", bundle: nil), forCellReuseIdentifier: "cardClassView")
        }
    }
    @IBOutlet weak var dateSelectCollection: UICollectionView!{
        didSet{
            dateSelectCollection.register(UINib.init(nibName: "DateSelectionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "dateSelectionCollection")
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
        return calendarClassCards.classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardClassView",for: indexPath) as! CardClassView
        cell.configCard(classes: calendarClassCards.classes[indexPath.row])
        return cell
    }
    
}

extension HomeDetailView: UITabBarDelegate {
}

extension HomeDetailView: HomeDetailViewProtocol {
    // TODO: implement view output methods
    
    func presenterCallBackData(classSchedule: [CalendarClass], status: Bool) {
        self.classSchedule = classSchedule
        self.calendarClassCards = classSchedule.first ?? CalendarClass()
        self.calendarClassDate = classSchedule
//        let indexPath = IndexPath(item: 0 , section: 0)
//        DispatchQueue.main.async {
//            self.dateSelectCollection.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
//        }
        dateSelectCollection.reloadData()
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

extension HomeDetailView : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return calendarClassDate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dateSelectionCollection", for: indexPath as IndexPath) as! DateSelectionCollectionViewCell
        cell.dateLbl.text = calendarClassDate[indexPath.row].key
        return cell
    }
}

extension HomeDetailView : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let indexPath = IndexPath(item: indexPath.row , section: 0)
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        
        self.calendarClassCards = classSchedule[indexPath.row]
        classesTbl.reloadData()
    }
}
