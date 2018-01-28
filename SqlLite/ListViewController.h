//
//  ListViewController.h
//  SqlLite
//
//  Created by Student P_07 on 28/01/18.
//  Copyright © 2018 7070. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController{
    NSArray *array;
}
@property (weak, nonatomic) IBOutlet UITableView *tblList;

@end
