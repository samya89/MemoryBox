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
@property UIImage *boxImage;

@end
RLM_ARRAY_TYPE(Box)

