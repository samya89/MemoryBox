//
//  AddBoxViewController.h
//  MemoryBox
//
//  Created by Samia Al Rahmani on 4/20/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Box;

@interface AddBoxViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *boxImageView;
@property (weak, nonatomic) IBOutlet UITextField *addBoxTextfield;

@property (strong, nonatomic) Box *box;

- (IBAction)addBox:(id)sender;

- (IBAction)cancel:(id)sender;

@end
