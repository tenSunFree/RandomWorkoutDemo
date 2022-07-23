import UIKit

final class LiveCell: UICollectionViewCell {
    static let reuseID = "ExerciseCell"
    private let exerciseImage = UIImageView()
    private let titleLabel = TitleLabel(fontSize: 12, textAlignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(with bean: LiveBean) {
        exerciseImage.image = UIImage(named: bean.image)
        titleLabel.text = bean.title
    }
    
    private func configure() {
        contentView.backgroundColor = .green
        contentView.addSubview(exerciseImage)
        contentView.addSubview(titleLabel)
        translatesAutoresizingMaskIntoConstraints = false
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 10
        contentView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        exerciseImage.clipsToBounds = true
        exerciseImage.translatesAutoresizingMaskIntoConstraints = false
        exerciseImage.contentMode = .scaleAspectFill
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            exerciseImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            exerciseImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            exerciseImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CGFloat(8)),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: CGFloat(-8)),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: CGFloat(-8)),
        ])
    }
    
}
