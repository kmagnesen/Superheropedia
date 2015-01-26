//
//  ViewController.m
//  Superheropedia
//
//  Created by Kyle Magnesen on 1/19/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "Superhero.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *superheroTableView;
@property (nonatomic, strong) NSArray *heroes;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Superhero retrieveSuperheroesWithCompletion:^(NSArray *superheroes) {
        self.heroes = superheroes;
    }];
}

- (void)setHeroes:(NSArray *)heroes {
    _heroes = heroes;
    [self.superheroTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.heroes.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SuperheroCell"];
    Superhero *superhero = [self.heroes objectAtIndex:indexPath.row];

    cell.textLabel.text = superhero.name;
    cell.detailTextLabel.text = superhero.textDescription;
    cell.detailTextLabel.numberOfLines = 2;

    [cell.imageView setImage:superhero.image];
    [cell layoutSubviews];
//    cell.detailTextLabel.text = ((NSNumber *) [hero objectForKey:@"age"]).stringValue;
//= cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [hero objectForKey:@"age"]];
// previous two lines are equal however the line used is more common
    return cell;
}
@end
