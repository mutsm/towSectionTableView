//
//  ViewController.swift
//  towSectionTableView
//
//  Created by MutasemW on 2022-08-29.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    var sectionArray = ["Country","Weapon","Device"]
    var firstOptionsArray = [["Kuwait","Qatana","Paris","Umraniye","Beykoz","Istabul"],["Winchister","A400","Maxus","Huglu","Beretta","Browning"],["Iphone","Samsung","Huwaui","Nokie","LG","Motorolla"]]
    var selectedItem = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "OwnCellTableViewCell", bundle: nil), forCellReuseIdentifier: "OwnCellTableViewCell")
        tableView.separatorStyle = .none
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstOptionsArray[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OwnCellTableViewCell", for: indexPath) as! OwnCellTableViewCell
        cell.selectionStyle = .none
      
        if selectedItem.contains(firstOptionsArray[indexPath.section][indexPath.row]) {
            cell.icon.image = UIImage(named: "check")
        }else {
            cell.icon.image = UIImage(named: "uncheck")
        }
//        if firstOptionsArray[indexPath.section][indexPath.row] == selectedItem.first {
//        cell.icon.image = UIImage(named: "check")
//        }else {
//        cell.icon.image = UIImage(named: "uncheck")
//        }
        cell.lbl.text = firstOptionsArray[indexPath.section][indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionArray[section]
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected = firstOptionsArray[indexPath.section][indexPath.row]
        //selectedItem.removeAll()
       // selectedItem.append(selected)
       
        if selectedItem.contains(firstOptionsArray[indexPath.section][indexPath.row]) {
            let tt = firstOptionsArray[indexPath.section][indexPath.row]
            let fff  = selectedItem.firstIndex(of: tt)
            if fff ?? 0 >= 0 {

                selectedItem.remove(at: fff ?? 0)
            }
        }else  {
            selectedItem.append(selected)
        }
        tableView.reloadData()
        
    }

}
