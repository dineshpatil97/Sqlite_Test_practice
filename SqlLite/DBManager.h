//
//  DBManager.h
//  SqlLite
//
//  Created by Student P_07 on 27/01/18.
//  Copyright © 2018 7070. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBManager : NSObject
+(DBManager *)getInstance;
+(BOOL)savaData:(NSString *)name alongAddress:(NSString *)address alsoCity:(NSString *)city;
+(NSArray *)getAllRecordsFromUserDetail:(NSString *)strQuery;
@end
