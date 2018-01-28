//
//  ViewController.h
//  SqlLite
//
//  Created by Student P_07 on 27/01/18.
//  Copyright © 2018 7070. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *txt_name;
- (IBAction)btn_Srch:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *txt_Add;
@property (weak, nonatomic) IBOutlet UITextField *txt_CIty;
- (IBAction)btn_save:(id)sender;
- (IBAction)bt_List:(id)sender;

@end

