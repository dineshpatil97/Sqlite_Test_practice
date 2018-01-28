//
//  ListViewController.m
//  SqlLite
//
//  Created by Student P_07 on 28/01/18.
//  Copyright © 2018 7070. All rights reserved.
//

#import "ListViewController.h"
#import "DBManager.h"
#import "ListTableViewCell.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  array =   [DBManager getAllRecordsFromUserDetail:@"select * from userdetails"];

    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return array.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[ListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.lblname.text = [[array objectAtIndex:indexPath.row] valueForKey:@"name"];
    cell.lblCity.text = [[array objectAtIndex:indexPath.row] valueForKey:@"address"];
    cell.lblAddress.text = [[array objectAtIndex:indexPath.row] valueForKey:@"city"];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
