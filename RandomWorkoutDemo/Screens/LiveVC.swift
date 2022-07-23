import UIKit

final class LiveVC: UIViewController {
    
    private enum Section { case main }
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, LiveBean>!
    private var liveBeanList: [LiveBean] = []
    private let model = LiveModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureColecctionView()
        configureDataSource()
        getLiveBeanList()
    }
    
    private func configureColecctionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeColumnFLowLayout())
        view.addSubview(collectionView)
        collectionView.register(LiveCell.self, forCellWithReuseIdentifier: LiveCell.reuseID)
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, LiveBean>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, exercise) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LiveCell.reuseID, for: indexPath) as! LiveCell
            cell.set(with: exercise)
            return cell
        })
    }
    
    private func updateData() {
        var snapshop = NSDiffableDataSourceSnapshot<Section, LiveBean>()
        snapshop.appendSections([.main])
        snapshop.appendItems(liveBeanList)
        DispatchQueue.main.async { self.dataSource.apply(snapshop, animatingDifferences: true) }
    }
    
    private func getLiveBeanList() {
        liveBeanList = model.getLiveBeanList()
        updateData()
    }
    
    private func createThreeColumnFLowLayout() ->UICollectionViewFlowLayout {
        let width = view.bounds.width
        let itemWidth = width / 2 - 13
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        return flowLayout
    }
    
}
