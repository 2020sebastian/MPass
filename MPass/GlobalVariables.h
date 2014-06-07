//
//  GlobalVariables.h
//  MPass
//
//  Created by Sebastian Demian on 6/5/14.
//  Copyright (c) 2014 Sebastian Demian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalVariables : NSObject{

   
    
    NSMutableDictionary * users;
    NSString * currentUser; //username of currently logged in user
    NSMutableArray * tempRegistrationInfo;

}

@property(nonatomic) NSMutableDictionary * users;
@property(nonatomic) NSString * currentUser;
@property(nonatomic) NSMutableArray * tempRegistrationInfo;

//instance of global variables object
+(GlobalVariables*) getSingleObject;

@end
