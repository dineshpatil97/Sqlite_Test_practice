//
//  ViewController.m
//  SqlLite
//
//  Created by Student P_07 on 27/01/18.
//  Copyright © 2018 7070. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}













- (IBAction)btn_save:(id)sender {
    
    if ([_txt_name.text isEqualToString:@""]) {
        
    }else if ([_txt_Add.text isEqualToString:@""]){
        
    }else if ([_txt_CIty.text isEqualToString:@""]){
        
    }else{
        [DBManager savaData:_txt_name.text alongAddress:_txt_Add.text alsoCity:_txt_CIty.text];
    }
}

- (IBAction)bt_List:(id)sender {
}
- (IBAction)btn_Srch:(id)sender {
}
@end
