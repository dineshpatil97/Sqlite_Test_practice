//
//  ListTableViewCell.h
//  SqlLite
//
//  Created by Student P_07 on 28/01/18.
//  Copyright © 2018 7070. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblname;
@property (weak, nonatomic) IBOutlet UILabel *lblAddress;
@property (weak, nonatomic) IBOutlet UILabel *lblCity;

@end
