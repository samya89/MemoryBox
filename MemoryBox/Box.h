//
//  Box.h
//  MemoryBox
//
//  Created by Samia Al Rahmani on 4/18/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <Realm/Realm.h>
#import <UIKit/UIKit.h>

@interface Box : RLMObject

@property NSString *boxName;
@property NSData *imageData;

- (instancetype)initWithName:(NSString *)boxName andImage:(NSData *)imageData;

@end

