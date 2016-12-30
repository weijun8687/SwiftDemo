//
//  ViewController.swift
//  Demo1
//
//  Created by WJ on 16/7/17.
//  Copyright © 2016年 WJ. All rights reserved.
//

import UIKit


class ViewController: UIViewController ,UICollisionBehaviorDelegate{

    
    // 动画
    var animator: UIDynamicAnimator!
    // 重力
    var gravity: UIGravityBehavior!
    // 设置边界
    var collision: UICollisionBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        square.backgroundColor = UIColor.gray
        view.addSubview(square)
        
        let barrier = UIView(frame: CGRect(x: 0, y: 300, width: 130, height: 20))
        barrier.backgroundColor = UIColor.red
        view.addSubview(barrier)
        
        animator = UIDynamicAnimator(referenceView: view)
//        animator = UIDynamicAnimator(referenceView: <#T##UIView#>)
        gravity = UIGravityBehavior(items: [square])
        animator.addBehavior(gravity)
        
        // 边界(设置碰撞反应)
        collision = UICollisionBehavior(items: [square])
        // add a boundary that has the same frame as the barrier(给红色控件设置一个看不见的边框碰撞,这样灰色的控件碰到红色的控件时只会使自己发生偏移,而红色控件是不会移动的)
        collision.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: barrier.frame))
        
        // 将障碍控件联系起来(这样发生碰撞之后两个控件都会发生移动)
//        collision = UICollisionBehavior(items: [square, barrier])
        
        // 设置边界为屏幕的大小
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        // 碰撞检测里面有action属性,动画每一帧都会执行action block。
        collision.action = {
            // 打印 transform 和中心点
            print("\(NSStringFromCGAffineTransform(square.transform)) \(NSStringFromCGPoint(square.center))")
        }
        
        collision.collisionDelegate = self
    }
    
    // 当发生碰撞时会执行这个代理回调
    private func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, atPoint p: CGPoint) {
        print("Boundary contact occurred - \(identifier)")
    }


}

