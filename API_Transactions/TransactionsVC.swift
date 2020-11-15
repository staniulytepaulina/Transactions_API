import UIKit

class TransactionsVC: UIViewController {
    let tableView = UITableView()
    let amountLabel = UILabel()
    var safeArea: UILayoutGuide!
    var transactionsList = [Transaction]()
    var totalAmount: Double = 0.00
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        tableView.register(TransactionCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        setupLabel()
        setupTableView()
        
        let annonymousFunction = { (fetchedTransactionsList: [Transaction]) in
            DispatchQueue.main.async {
                self.transactionsList = fetchedTransactionsList
                self.tableView.reloadData()
                self.calculateAmount()
                self.amountLabel.text = "Current balance: \(self.totalAmount)"
            }
        }
        TransactionAPI.shared.fetchTransactions(completionHandler: annonymousFunction)
    }
    
    // MARK: Setting up the subviews
    
    func setupLabel() {
        view.addSubview(amountLabel)
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.textAlignment = .center
        amountLabel.text = "Current balance: \(totalAmount)"
        amountLabel.font = UIFont(name: "Verdana-Bold", size: 24)
        amountLabel.backgroundColor = .white
        amountLabel.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        amountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        amountLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        amountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: amountLabel.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func calculateAmount() {
        totalAmount = transactionsList.map({$0.amount}).map({Double($0)}).compactMap({$0}).reduce(0, +)
    }
}

// MARK: UITableViewDataSource

extension TransactionsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let transaction = transactionsList[indexPath.row]
        
        guard let transactionCell = cell as? TransactionCell else {
            return cell
        }
        transactionCell.selectionStyle = .none
        
        transactionCell.idLabel.text = "ID: \(transaction.id)"
        transactionCell.nameLabel.text = "From: \(transaction.counterPartyName)"
        transactionCell.accountLabel.text = "Account: \(transaction.counterPartyAccount)"
        
        switch transaction.type {
        case .credit:
            transactionCell.typeLabel.text = "Type: Credit"
        case .debit:
            transactionCell.typeLabel.text = "Type: Debit"
        }
        
        transactionCell.descriptionLabel.text = "For: \(transaction.description)"
        transactionCell.dateLabel.text = transaction.date
        transactionCell.amountLabel.text = "Amount: \(transaction.amount)"
        return cell
    }
}
