//
//  Box.m
//  MemoryBox
//
//  Created by Samia Al Rahmani on 4/18/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "Box.h"

@implementation Box

- (instancetype)initWithName:(NSString *)boxName andImage:(NSData *)imageData{
    self = [super init];
    if (self) {
        _boxName = boxName;
        _imageData = imageData;
    }
    return self;
}

@end
