//
//  Superhero.h
//  Superheropedia
//
//  Created by Kyle Magnesen on 1/26/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Superhero : NSObject

@property NSString *name;
@property NSString *textDescription;
@property UIImage *image;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (void)retrieveSuperheroesWithCompletion:(void(^)(NSArray *))complete;

@end
