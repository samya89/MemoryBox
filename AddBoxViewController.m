//
//  AddBoxViewController.m
//  MemoryBox
//
//  Created by Samia Al Rahmani on 4/20/15.
//  Copyright (c) 2015 Samya Al Rahmani. All rights reserved.
//

#import "AddBoxViewController.h"
#import "Box.h"
#import "BoxCollectionViewController.h"

@interface AddBoxViewController ()

@end

@implementation AddBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.boxImageView.image = [UIImage imageNamed:@"drawerIcon.png"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addBox:(id)sender {
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
