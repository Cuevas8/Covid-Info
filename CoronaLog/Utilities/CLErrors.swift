//
//  CLErrors.swift
//  CoronaLog
//
//  Created by Bryan Cuevas on 5/15/20.
//  Copyright © 2020 bryanCuevas. All rights reserved.
//

import Foundation
enum CLErrors: String, Error {
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}
