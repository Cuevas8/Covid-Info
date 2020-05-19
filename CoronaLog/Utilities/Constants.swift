//
//  Constants.swift
//  CoronaLog
//
//  Created by Bryan Cuevas on 5/14/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

//Icons made by https://www.flaticon.com/authors/smashicons

import UIKit

enum SFSymbols {
    static let globe = UIImage(systemName: "globe")
    static let search = UIImage(systemName: "magnifyingglass")
}

enum apiKeys {
    static let rapidAPIKey = "2521683939mshda892d1dedbfd27p109420jsnf2cfd6065012"
}

func returnFormattedNumber(numberToConvert: Int) -> String{
    let formatter = NumberFormatter()
    formatter.locale = NSLocale.current // this ensures the right separator behavior
    formatter.numberStyle = NumberFormatter.Style.decimal
    formatter.usesGroupingSeparator = true
    
    return formatter.string(from: NSNumber(value: numberToConvert)) ?? "---"
}


