//
//  ViewController.swift
//  HeathTips
//
//  Created by Zeeshan Khan on 10/10/16.
//  Copyright © 2016 Zeeshan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tips: [Tip] = DataModel().getData()
//    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ViewController : UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tips.count;
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell : TipsTableViewCell = tableView.dequeueReusableCell(withIdentifier: TipsTableViewCell.reusableIdentifier, for: indexPath) as! TipsTableViewCell

        cell.textLabel?.text = tips[indexPath.row].text
        cell.textLabel?.numberOfLines = 0

        return cell

    }
}

class TipsTableViewCell : UITableViewCell {}

protocol ReusableCell: class {
    static var reusableIdentifier: String { get }
}

extension ReusableCell where Self: UIView {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell : ReusableCell {}

// http://alisoftware.github.io/swift/generics/2016/01/06/generic-tableviewcells/

