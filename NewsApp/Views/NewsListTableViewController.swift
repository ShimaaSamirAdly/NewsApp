//
//  NewsListViewController.swift
//  NewsApp
//
//  Created by Shimaa Samir on 5/25/19.
//  Copyright © 2019 Shimaa Samir. All rights reserved.
//

import UIKit
import SDWebImage
import SwifterSwift

class NewsListTableViewController: UITableViewController {

    let viewModel = NewsViewModel()
    var fetchMoreData = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        
        UIView.setAnimationsEnabled(false)

        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:  #selector(refreshList), for: .valueChanged)
        refreshControl.tintColor = UIColor.clear
        self.refreshControl = refreshControl
        
//        loadNewsList(isRefreshList: false)
        viewModel.getArticles()

    }
    
    
    @objc func refreshList() {
        self.fetchMoreData = false
        print("in heree in hereee")
        self.viewModel.page = 1
        
//        loadNewsList(isRefreshList: true)
        viewModel.getArticles()

    }

}


extension NewsListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
  
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNoOfCells()
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell") as? NewsTableViewCell {
            cell.articleImg.sd_imageIndicator = SDWebImageActivityIndicator.gray
            cell.articleImg.sd_setImage(with: URL(string: viewModel.getImageUrl(index: indexPath.row)), placeholderImage: nil)
            cell.articleTitle.text = viewModel.getArticleTitle(index: indexPath.row)
            cell.articleDescription.text = viewModel.getArticleDescription(index: indexPath.row)
            cell.authorName.text = "By: \(viewModel.getAuthorName(index: indexPath.row))"
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let articleDescViewController = storyBoard.instantiateViewController(withIdentifier: "articleDesc") as! ArticleDescriptionViewController
        articleDescViewController.modalPresentationStyle = .overCurrentContext
        let articleDescViewModel = ArticleDescriptionViewModel(articleDescription: self.viewModel.getArticleDescription(index: indexPath.row))
        articleDescViewController.viewModel = articleDescViewModel
        self.present(articleDescViewController, animated: true, completion: nil)
    }
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offestY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offestY > contentHeight - scrollView.frame.height && viewModel.hasMoreData() {
            
            if fetchMoreData {
                print("in hereee scroll")
                fetchMoreData = false
                viewModel.page += 1
//                loadNewsList(isRefreshList: false)
                viewModel.getArticles()

            }
        }
    }
    
    
//    func loadNewsList(isRefreshList: Bool) {
//        viewModel.getArticles {
//            if isRefreshList {
//                self.refreshControl?.endRefreshing()
//            }
//
//            self.tableView.reloadData(){
//                self.fetchMoreData = true
//            }
//
//        }
    
//    }
    
    
}


extension NewsListTableViewController: MainProtocol {
    func startLoading() {
        self.showLoader()
    }
    
    func stopLoading() {
        self.hideLoader()
    }
    
    func succefullyFetchData() {
        self.refreshControl?.endRefreshing()
        self.tableView.reloadData(){
            self.fetchMoreData = true
        }
    }
    
    
}
