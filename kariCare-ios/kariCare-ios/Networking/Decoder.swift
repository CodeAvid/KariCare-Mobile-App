//
//  Decoder.swift
//  kariCare-ios
//
//  Created by akhigbe benjamin on 28/05/2021.
//

import Foundation

class Decoder<T: Decodable> {
    func decode(from data: Data) -> (Result<T,Error>) {
        do {
            let json = try JSONDecoder().decode(T.self, from: data)
            return .success(json)
        } catch {
            return .failure(error)
        }
    }
}
