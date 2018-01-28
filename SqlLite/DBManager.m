//   DBManager.m
//      SqlLite
//   Created by Student P_07 on 27/01/18.
//   Copyright © 2018 7070. All rights reserved.

#import "DBManager.h"
static DBManager * sharedInstance = nil;
static sqlite3 * database =nil;
static sqlite3_stmt *stmt = nil;


@implementation DBManager


+(DBManager *)getInstance
{
    if (sharedInstance == nil) {
        sharedInstance = [[DBManager alloc]init];
        
    }
    [self createDB];
    
    
    return sharedInstance;
    
}

+(NSString *)dbPath{
    
    NSArray * array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * strDirectoryPath =array[0];
    
    
    NSString * strpDBpath =[strDirectoryPath stringByAppendingPathComponent:@"person.sqlite"];
    
    return strpDBpath;
}
+(BOOL)createDB{
   
    NSFileManager * filemanager = [NSFileManager defaultManager];
    
    if ([filemanager fileExistsAtPath:[self dbPath]] == NO)
    {
        const char * databasePath =[[self dbPath] UTF8String];
        
        if (sqlite3_open(databasePath,&database)== SQLITE_OK)
        {
            NSString * sql = @"create table userdetails(id integer primary key autoincrement,name text,address text,city text)";
            
            const char * query =[sql UTF8String];
            char * error = NULL;
            
        if (sqlite3_exec(database, query, NULL, NULL, &error)== SQLITE_OK) {
            
            sqlite3_close(database);
            return YES;
            
        
            }
            
        }
        
    }
    
    return NO;
    
}
+(BOOL)savaData:(NSString *)name alongAddress:(NSString *)address alsoCity:(NSString *)city{
    const char *dbpath = [[self dbPath] UTF8String];
    
    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
        NSString *strQuery = [NSString stringWithFormat:@"insert into userdetails (name,address,city) values (\"%@\",\"%@\",\"%@\")",name,address,city];
        const char *query = [strQuery UTF8String];
        if (sqlite3_prepare_v2(database, query, -1, &stmt, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(stmt) == SQLITE_DONE) {
                sqlite3_close(database);
                return YES;
            }
        }
        sqlite3_close(database);
    }
    return NO;
}

+(NSArray *)getAllRecordsFromUserDetail:(NSString *)strQuery{
    
    const char *dbpath = [[self dbPath] UTF8String];

    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
        
        const char *query = [strQuery UTF8String];
        if (sqlite3_prepare_v2(database, query, -1, &stmt, NULL) == SQLITE_OK)
        {
            NSMutableArray *array = [[NSMutableArray alloc]init];
            while (sqlite3_step(stmt) == SQLITE_ROW) {
                NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
                
                int myno = sqlite3_column_int(stmt, 0);
               
                [dict setObject:[NSNumber numberWithInt:myno] forKey:@"id"];
                NSString *strName = [[NSString alloc]initWithUTF8String:(const char*)sqlite3_column_text(stmt, 1)];
                [dict setObject:strName forKey:@"name"];
                
                NSString *strAddress = [[NSString alloc]initWithUTF8String:(const char*)sqlite3_column_text(stmt, 2)];
                [dict setObject:strAddress forKey:@"address"];
                
                NSString *strCity = [[NSString alloc]initWithUTF8String:(const char*)sqlite3_column_text(stmt, 3)];
                [dict setObject:strCity forKey:@"city"];
                [array addObject:dict];
                
            }
            sqlite3_close(database);
            return array;
        }
        sqlite3_close(database);
    }
    return @[];
}
@end
