//
//  ViewController.swift
//  HeathTips
//
//  Created by Zeeshan Khan on 10/10/16.
//  Copyright © 2016 Zeeshan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ViewController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell : TipsTableViewCell = tableView.dequeueReusableCell(withIdentifier: TipsTableViewCell.reusableIdentifier, for: indexPath) as! TipsTableViewCell

        cell.textLabel?.text = String("Row \(indexPath.row)")

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

