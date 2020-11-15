import UIKit

class TransactionCell: UITableViewCell {
    
    var safeArea: UILayoutGuide!
    let idLabel = UILabel()
    let nameLabel = UILabel()
    let accountLabel = UILabel()
    let typeLabel = UILabel()
    let descriptionLabel = UILabel()
    let dateLabel = UILabel()
    let amountLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    
    func setupView() {
        safeArea = layoutMarginsGuide
        setupIdLabel()
        setupNameLabel()
        setupAccountLabel()
        setupTypeLabel()
        setupDescriptionLabel()
        setupDateLabel()
        setupAmountLabel()
    }
    
    func setupIdLabel() {
        addSubview(idLabel)
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        idLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        idLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        idLabel.font = UIFont(name: "Verdana", size: 14)
        idLabel.textColor = .lightGray
    }
    
    func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: idLabel.leadingAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 3).isActive = true
        nameLabel.font = UIFont(name: "Verdana", size: 16)
    }
    
    func setupAccountLabel() {
        addSubview(accountLabel)
        accountLabel.translatesAutoresizingMaskIntoConstraints = false
        accountLabel.leadingAnchor.constraint(equalTo: idLabel.leadingAnchor).isActive = true
        accountLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3).isActive = true
        accountLabel.font = UIFont(name: "Verdana", size: 16)
    }
    
    func setupTypeLabel() {
        addSubview(typeLabel)
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.leadingAnchor.constraint(equalTo: idLabel.leadingAnchor).isActive = true
        typeLabel.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: 3).isActive = true
        typeLabel.font = UIFont(name: "Verdana", size: 14)
        typeLabel.textColor = .darkGray
    }
    
    
    func setupDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leadingAnchor.constraint(equalTo: idLabel.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 3).isActive = true
        descriptionLabel.font = UIFont(name: "Verdana", size: 14)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.textColor = .darkGray
    }
    
    func setupDateLabel() {
        addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        dateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
        dateLabel.font = UIFont(name: "Verdana", size: 14)
    }
    
    func setupAmountLabel() {
        addSubview(amountLabel)
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        amountLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 3).isActive = true
        amountLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        amountLabel.font = UIFont(name: "Verdana-Bold", size: 16)
    }
}
