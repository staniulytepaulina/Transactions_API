import Foundation

struct Transaction: Codable {
    let id: String
    let counterPartyName: String
    let counterPartyAccount: String
    let type: TypeEnum
    let amount: String
    let description: String
    let date: String

    enum TypeEnum: String, Codable {
        case credit = "credit"
        case debit = "debit"
    }
}
