//
//  ViewController.h
//  NextLiveMatches
//
//  Created by Dragosy on 4/25/13.
//  Copyright (c) 2013 Dragosy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITabBarDelegate>

@property (strong) NSArray *participantsArr;

@end
