//
//  StandardDataProvider.swift
//  bright-widget-app
//
//  Created by Luka Vujnovac on 5/7/24.
//

import Combine
import Foundation

class LocalDataProvider: DataProvider {
    @discardableResult
    func fetch<T: Decodable>(for resource: String, withExtension extension: String) -> AnyPublisher<T, Error> {
        Future<T, Error> { promise in
            if let fileLocation = Bundle.main.url(forResource: resource, withExtension: `extension`) {
                do {
                    let data = try Data(contentsOf: fileLocation)
                    let dataFromJSON = try JSONDecoder().decode(T.self, from: data)
                    promise(.success(dataFromJSON))
                } catch {
                    promise(.failure(error))
                }
            } else {
                promise(
                    .failure(
                        NSError(
                            domain: "local/domain",
                            code: 404,
                            userInfo: [NSLocalizedDescriptionKey: "File not found"]
                        )
                    )
                )
            }
        }.eraseToAnyPublisher()
    }
}
