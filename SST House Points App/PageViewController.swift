//
//  PageViewController.swift
//  SST House Points App
//
//  Created by Sebastian Choo on 18/8/18.
//  Copyright © 2018 SebastianChoo.Co. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    lazy var subViewController: [UIViewController] = {
        return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Page1") as! MainPageViewController,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Page2") as! HouseDescriptionViewController,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Page3") as!
                    AnnouncementViewController,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Page4") as! RankingsViewController,
        ]
    }()

    var pageControl = UIPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        setViewControllers([subViewController[0]], direction: .forward, animated: true, completion: nil)
        // Do any additional setup after loading the view.
        configurePageControl()
    }

    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width, height: 50))
        pageControl.numberOfPages = subViewController.count
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }

    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewController.count
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex: Int = subViewController.index(of: viewController) ?? 0
        if (currentIndex <= 0) {
            return nil
        }
        return subViewController[currentIndex - 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex: Int = subViewController.index(of: viewController) ?? 0
        if (currentIndex >= subViewController.count - 1) {
            return nil
        }
        return subViewController[currentIndex + 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = subViewController.index(of: pageContentViewController)!
    }
}
