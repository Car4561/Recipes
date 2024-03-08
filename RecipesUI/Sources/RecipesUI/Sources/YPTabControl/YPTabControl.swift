//
//  YPTabControl.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 15/05/23.
//

import UIKit

public protocol YPTabControlDelegate: AnyObject {
    
    func didSelect(item: YPTabItem)
}

public protocol YPTabItem {

    var title: String { get }
}

public class YPTabControl: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    
    private var horizontalPadding: CGFloat = 16
    
    public weak var delegate: YPTabControlDelegate?
    
    public var items: [YPTabItem] = []
    
    
    // MARK: - Initializers
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    
    // MARK: - Views
    
    private var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(YPTabCollectionViewCell.self)
        return collectionView
    }()

    // MARK: - Public methods
    
    public func configure(with items: [YPTabItem]) {
        self.items = items
        collectionView.reloadData()
        setFirstTabSelectedState()
    }
    
    public func setTabsDeselected() {
        guard let selectedIndex = collectionView.indexPathsForSelectedItems?.first else { return }
        collectionView.deselectItem(at: selectedIndex, animated: false)
    }
    
    // MARK: - Private helpers
    
    private func setUpViews() {
        collectionView.delegate = self
        collectionView.dataSource = self

        addSubview(collectionView)

        collectionView.pinToSuperview()
    }
    
    private func setFirstTabSelectedState() {
        guard !items.isEmpty else { return }
        collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .top)
    }
    
    public func setSelectedItem(item: String) {
        guard !items.isEmpty else { return }
        
        if let itemIndex = items.firstIndex(where: {$0.title == item}) {
            collectionView.selectItem(at: IndexPath(row: itemIndex, section: 0), animated: false, scrollPosition: .top)
        }
    }
    
    // MARK: - CollectionView Protocol
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let collectionViewFlowLayout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return .zero}
        let itemWidth = collectionView.frame.width / CGFloat(items.count) - (horizontalPadding * 2) + collectionViewFlowLayout.minimumInteritemSpacing
        let fixedSize = CGSize(width: itemWidth, height: 40)
        
        return fixedSize
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: horizontalPadding, bottom: 0, right: horizontalPadding)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let tabItem = items[indexPath.row]
        delegate?.didSelect(item: tabItem)
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as YPTabCollectionViewCell
        let tabItem = items[indexPath.row]
        cell.configure(with: tabItem)
        
        return cell
    }
}
