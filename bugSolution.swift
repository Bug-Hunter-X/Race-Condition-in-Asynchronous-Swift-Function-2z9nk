import Foundation

func fetchData(completion: @escaping (Result<[String], Error>) -> Void) {
    let semaphore = DispatchSemaphore(value: 1)
    semaphore.wait()
    DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
        let data = ["data1", "data2", "data3"]
        if data.isEmpty {
            completion(.failure(NSError(domain: "fetchData", code: 1, userInfo: [NSLocalizedDescriptionKey: "No data found!" ])))
        }
        else{
            completion(.success(data))
        }
        semaphore.signal()
    }
}