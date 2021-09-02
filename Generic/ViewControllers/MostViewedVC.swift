//
//  ViewController.swift
//  Generic
//
//  Created by Jahan on 02/09/2021.
//

import UIKit
import MBProgressHUD
import SwiftyJSON

class MostViewedVC: UIViewController {

    ///:- Layout Outlets
    @IBOutlet weak var listTV: UITableView!
    
    ///:- Veriables
    var modelsList = [MostViewedModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }

    
    ///:- General Functions
    
    func setupUI(){
        let nib = UINib(nibName: Constants.TableViewCells.MostViewedTVCell, bundle: Bundle.main)
        listTV.register(nib, forCellReuseIdentifier: Constants.TableViewCells.MostViewedTVCell)
        listTV.dataSource = self
        listTV.delegate = self
        getMostViewedList()
    }

    func getMostViewedList(){
        modelsList.removeAll()
        MBProgressHUD.showAdded(to: self.view, animated: true)
        NetworkManager.sharedInstance.getMostViewedList() { (response) in
            MBProgressHUD.hide(for: self.view, animated: true)
            if (response.error != nil) {
                print(response.error ?? "Error")
                AlertControllerHelper.showAlert(message:response.error?.localizedDescription ?? "Server Error : Please try again.")
                return
            }
            if response.error == nil {
                do {
                    let jsonData = try JSON(data: response.data!)
                    let status = jsonData["status"].stringValue
                    if status == "OK" {
                        let jsonData = jsonData["results"]
                        for json in jsonData {
                            let model = MostViewedModel(fromJson: json.1)
                            self.modelsList.append(model)
                        }
                        self.listTV.reloadData()
                    }else{
                        let msg = jsonData["message"].stringValue
                        print(msg)
                        AlertControllerHelper.showAlert(message: msg)
                    }
                } catch{
                    print(error.localizedDescription)
                    AlertControllerHelper.showAlert(message: error.localizedDescription)
                }
            }else {
                print(Error.self)
                AlertControllerHelper.showAlert(message: "\(response.error?.localizedDescription ?? "Error in api call.")")
            }
        }
    }
    
    
    ///:- Button Actions
    @IBAction func btnMoreAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnSearchAction(_ sender: UIButton) {
        
    }
    
    @IBAction func btnMenuAction(_ sender: UIButton) {
        
    }
    

}

///:- Delegates

extension MostViewedVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if modelsList.count == 0 {
            tableView.setEmptyMessage("Stories not found.")
        }else{
            tableView.restore()
        }
        return modelsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCells.MostViewedTVCell, for: indexPath) as! MostViewedTVCell
        cell.configCell(model: self.modelsList[indexPath.row])
        cell.selectionStyle = .none
        cell.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AlertControllerHelper.showAlertWithCompletion(message: "Do you want to open this article?") { (succuss) in
            if succuss {
                if let url = URL(string:self.modelsList[indexPath.row].url) {
                    UIApplication.shared.open(url)
                }
            }
        }
    }
}
