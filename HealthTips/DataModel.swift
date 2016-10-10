//
//  DataModel.swift
//  HealthTips
//
//  Created by Zeeshan Khan on 10/10/16.
//  Copyright © 2016 Zeeshan. All rights reserved.
//

import Foundation
import RealmSwift

struct DataModel {

    func getData() -> [Tip] {

        let realm = try! Realm()

//        try! realm.write {
//            realm.deleteAll()
//        }

        var tips: [Tip] = realm.objects(Tip.self).map({ $0 })
        if tips.count > 0 {
            return tips
        }

        let path = Bundle.main.path(forResource: "Tips", ofType: "csv")
        let data = try? String.init(contentsOfFile: path!)
        let lines = data?.components(separatedBy: "\n")

        try! realm.write {
            for line in lines! {
                if line.characters.count > 0 {
                    let tip = Tip()
                    tip.text = line
                    tips.append(tip)
                    realm.add(tip)
                }
            }
        }


        return tips
    }
}

class Tip : Object {
    dynamic var text = ""
    dynamic var isFav = false
}
