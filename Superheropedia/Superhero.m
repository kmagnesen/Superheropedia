//
//  Superhero.m
//  Superheropedia
//
//  Created by Kyle Magnesen on 1/26/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "Superhero.h"

@implementation Superhero

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];

    if (self) {

    self.name = [dictionary objectForKey:@"name"];
    self.textDescription = [dictionary objectForKey:@"description"];
    self.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[dictionary objectForKey:@"avatar_url"]]]];

    }
    return self;
}

+ (void)retrieveSuperheroesWithCompletion:(void (^)(NSArray *))complete {
    NSURL *url = [NSURL URLWithString:@"https://s3.amazonaws.com/mobile-makers-lib/superheroes.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         NSArray *results = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
         NSMutableArray *heroes = [NSMutableArray array];

         for (NSDictionary *dictionary in results) {
             Superhero *superhero = [[Superhero alloc]initWithDictionary:dictionary];
             [heroes addObject:superhero];
         }
         complete(heroes);
     }];
}

@end
