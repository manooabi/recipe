//
//  SearchResultsViewController.swift
//  RecipeApp
//
//  Created by Manoo on 1/4/23.
//  Copyright © 2023 Manoo. All rights reserved.
//

import UIKit

protocol SearchResultsViewControllerDelegate: AnyObject{
    func searchResultsViewControllerDidTapItem(_ viewModel: TitlePreviewViewModel)
}

class SearchResultsViewController: UIViewController {
    
    
    public var titles: [Food] = [Food]()
    
    public weak var delegate: SearchResultsViewControllerDelegate?

    public let searchResultsCollectionView: UICollectionView = {
      
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 200)
        layout.minimumInteritemSpacing = 0
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(searchResultsCollectionView)
        
        searchResultsCollectionView.delegate = self
        searchResultsCollectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchResultsCollectionView.frame = view.bounds
    }

   

}

extension SearchResultsViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else{
            return UICollectionViewCell()
        }
        let title = titles[indexPath.row]
        cell.configure(with: title.photo ?? "")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let tiltle = titles[indexPath.row]
        let  titleName = tiltle.foodName ?? ""
        APICaller.shared.getRecipe(with: titleName) { [weak self] result in
            switch result{
            case.success(let videoElement):
                self?.delegate?.searchResultsViewControllerDidTapItem(TitlePreviewViewModel(title: tiltle.foodName ?? "", youtubeView: videoElement, titleOverview: tiltle.indegredients ?? ""))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    
    }
}
