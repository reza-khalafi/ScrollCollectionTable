//
//  ViewController.swift
//  CollectionScroll
//
//  Created by Reza Khalafi on 3/14/17.
//  Copyright © 2017 Reza Khalafi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate {

    
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var subView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    
    var dataSourceArr : Array<Array<String>>!
    
    var storedOffsets = [Int: CGFloat]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        dataSourceArr = [
            ["jason1","jason2","jason3"],
            ["james1","james2","james3"],
            ["lars1","lars2","lars3"]
        ]
        
        collectionView.reloadData()
        
    }


    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.contentSize = CGSize(width:(375 * dataSourceArr.count),height:300)
        collectionView.frame=CGRect(x:0 , y:0 , width:(375*dataSourceArr.count) , height:316 );
        
    }
    
    //MARK: Collection View
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,numberOfItemsInSection section: Int) -> Int {
        
        if dataSourceArr != nil {
            return dataSourceArr.count
        }
        return 0
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView,cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCellIdentifier",for: indexPath) as! CollectionViewCell
        
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("Collection: ", indexPath.row)
        
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize(width:375,height:316)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,insetForSectionAt section: Int) -> UIEdgeInsets{
        
        return UIEdgeInsetsMake(0,0,0,0)
        
    }

    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        
        guard let colViewCell = cell as? CollectionViewCell else { return }
        
        colViewCell.setTableViewDataSourceDelegate(self, forRow: indexPath.row)
        colViewCell.tableViewOffset = storedOffsets[indexPath.row] ?? 0

    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        guard let colViewCell = cell as? CollectionViewCell else { return }
        
        colViewCell.setTableViewDataSourceDelegate(self, forRow: indexPath.row)
        colViewCell.tableViewOffset = storedOffsets[indexPath.row] ?? 0
        
    }


}//





//MARK:_EXTENSION

extension ViewController :UITableViewDataSource,UITableViewDelegate{
    @available(iOS 2.0, *)
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataSourceArr != nil {
            return dataSourceArr[tableView.tag].count
        }
        return 0
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCellIdentifier", for: indexPath) as! TableViewCell
        
        let imageNameStr = dataSourceArr[tableView.tag][indexPath.row]
        cell.mainImage.image = UIImage(named:imageNameStr)
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
        
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print( "index path: section: \(indexPath.section) row: \(indexPath.row) "  )
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 211
    }
    
    
}






