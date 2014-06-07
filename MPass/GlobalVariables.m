//
//  GlobalVariables.m
//  MPass
//
//  Created by Sebastian Demian on 6/5/14.
//  Copyright (c) 2014 Sebastian Demian. All rights reserved.
//

#import "GlobalVariables.h"

@implementation GlobalVariables{

    GlobalVariables * anotherSingle;
    
    
}

@synthesize users;
@synthesize currentUser;
@synthesize tempRegistrationInfo;




+(GlobalVariables *) getSingleObject{
    static GlobalVariables * single = nil;
    
    @synchronized(self){
        if (!single){
            single = [[GlobalVariables alloc] init];
        }
    }
    return single;
}



@end
