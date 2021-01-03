//
//  ViewController.swift
//  TableViewHome1
//
//  Created by 황현지 on 2021/01/02.
//

import UIKit

class ViewController: UIViewController {
    //1번
    @IBOutlet weak var tableView: UITableView!
    
    //4번
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //*코드로 소스연결 self는 viewController임
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

}

//2번
//확장한다.  무엇을          무엇으로 datasource를 가진 것으로
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    //섹션, 셀, 셀의 구성을 함수로 나타내 주어야 한다.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //4-1
        return restaurantNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //7번 커스터마이징 한 경우 as 붙이기
       let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! Cell2
        
        cell1.nameLabel.text = restaurantNames[indexPath.row]
        cell1.locationLabel.text = restaurantLocations[indexPath.row]
        cell1.typeLabel.text = restaurantTypes[indexPath.row]
        cell1.imgView.image = UIImage(named: restaurantImages[indexPath.row])
        
//        //3-2. 객체화시킨 TableView를 가져옴
//      let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1")
//
//        //3-3.cell1안에 데이터 넣기
////        cell1?.textLabel!.text = "아무거나"
//
//        //4-2.
//        cell1?.textLabel!.text = restaurantNames[indexPath.row]
//        cell1?.detailTextLabel?.text = restaurantLocations[indexPath.row]
//        cell1?.imageView?.image = UIImage(named: restaurantImages[indexPath.row])
//
//        //3-4
////        cell1?.detailTextLabel?.text = "디테일영역"
//
//        //정해둔게 없을때는 UITableViewCell
////        return UITableViewCell()
        
        return cell1
    }
    
    //5
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let alert = UIAlertController(title: restaurantLocations[indexPath.row], message: restaurantNames[indexPath.row], preferredStyle: .alert)
        let cancelBtn = UIAlertAction(title: "", style: .cancel, handler: nil)
        
        alert.addAction(cancelBtn)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    //7 셀을 선택했을 때
    //7-1 오른쪽 옆으로
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // 어떤 액션, 어디쪽에서 움직이는지, 어떻게 처리하는지 네이밍
       let btnAction = UIContextualAction(style: .destructive, title: "버튼1") { (action, sourceView, completion) in
            print("버튼1은 오른쪽")
        }
        
       let btnAction2 = UIContextualAction(style: .destructive, title: "버튼2") { (action, sourceView, completion) in
            print("버튼2도 오른쪽")
        }
        
                        //UISwipeActionsConfiguration(actions: <#T##[UIContextualAction]#>) < 액션은 배열형태로
        let swipeConfig = UISwipeActionsConfiguration(actions: [btnAction2, btnAction])
        
        //7-1-1 컬러 교체
        btnAction.backgroundColor = .black
        btnAction2.backgroundColor = .systemPink
        //7-1-2 이미지 첨부 (named: google material icon-selected icon - ios - png /해상도는 주로 24나 36사용)
        btnAction.image = UIImage(systemName: "trash")
        
        return swipeConfig
        
    }
    //7-2 왼쪽 옆으로
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let shareAction = UIContextualAction(style: .normal, title: "share") { (action, sourceView, completion) in
            print("share버튼")
        }
        let heartAction = UIContextualAction(style: .normal, title: "share") { (action, sourceView, completion) in
            print("heatr버튼")
        }
        
        let swipeConfig = UISwipeActionsConfiguration(actions: [shareAction, heartAction])
        
        shareAction.backgroundColor = .blue
        heartAction.backgroundColor = .yellow
        
        return swipeConfig
    }
}

//3번 셀 구성하기 Main.storyboard로 이동.
//3-1. 각각의 Table View cell에 id를 준다

//6 storyboard 커스터마이징 후 cell2 - cocoa파일(UITableViewCell) 생성
