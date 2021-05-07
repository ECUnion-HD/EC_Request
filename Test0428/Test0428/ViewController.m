//
//  ViewController.m
//  Test0428
//
//  Created by TongDi on 2021/4/28.
//

#import "ViewController.h"
#import "Cell1.h"
#import "Cell2.h"
#import "Cell3.h"
#import "Request.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableVew;

@property (nonatomic, strong) NSMutableDictionary *cache;
@property (nonatomic, strong) NSMutableDictionary *dataCache;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableVew.tableFooterView = UIView.new;
    
    [self.tableVew registerNib:[UINib nibWithNibName:@"Cell1" bundle:nil] forCellReuseIdentifier:@"Cell1"];
    [self.tableVew registerNib:[UINib nibWithNibName:@"Cell2" bundle:nil] forCellReuseIdentifier:@"Cell2"];
    [self.tableVew registerNib:[UINib nibWithNibName:@"Cell3" bundle:nil] forCellReuseIdentifier:@"Cell3"];
    
    self.cache = @{}.mutableCopy;
    self.dataCache = @{}.mutableCopy;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 88;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        Cell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1"
                                                      forIndexPath:indexPath];
        if (!self.cache[indexPath]) {
            Request *req = [[Request alloc] init];
            [cell.loading startAnimating];

            [req requestCell1Data:^(id  _Nonnull data, NSError * _Nonnull err) {
                [cell.loading stopAnimating];
                self.dataCache[indexPath] = data;
                
                [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            }];
            self.cache[indexPath] = req;
        }
        else {
            cell.textLabel.text = self.dataCache[indexPath];
        }

        return cell;
    }
    else if (indexPath.row == 1) {
        Cell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell2"
                                                      forIndexPath:indexPath];
        if (!self.cache[indexPath]) {
            Request *req = [[Request alloc] init];
            [cell.loading startAnimating];
            [req requestCell2Data:^(id  _Nonnull data, NSError * _Nonnull err) {
                [cell.loading stopAnimating];
                self.dataCache[indexPath] = data;

                [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            }];
            self.cache[indexPath] = req;
        }
        else {
            cell.textLabel.text = self.dataCache[indexPath];
        }


        return cell;
    }
    
    Cell3 *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell3"
                                                  forIndexPath:indexPath];
    if (!self.cache[indexPath]) {
        Request *req = [[Request alloc] init];
        [cell.loading startAnimating];

        [req requestCell3Data:^(id  _Nonnull data, NSError * _Nonnull err) {
            [cell.loading stopAnimating];
            self.dataCache[indexPath] = data;

            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];

        }];
        self.cache[indexPath] = req;
    }
    else {
        cell.textLabel.text = self.dataCache[indexPath];
    }


    return cell;

}

@end
