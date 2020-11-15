import Foundation

final class TransactionAPI {
    
    static let shared = TransactionAPI()
    
    func fetchTransactions(completionHandler: @escaping ([Transaction]) -> () ) {
        let url = URL(string: "https://sheet.best/api/sheets/ebb5bfdc-efda-4966-9ecf-d2c171d6985a")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                print("No data.")
                return
            }
            
            guard let transactionsList = try? JSONDecoder().decode([Transaction].self, from: data) else {
                print("Couldn't decode JSON.")
                return
            }
            completionHandler(transactionsList)
        }
        task.resume()
    }
}
