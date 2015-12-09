//
//  ViewController.m
//  testTableViewCellHeight
//
//  Created by zhang_rongwu on 15/12/4.
//  Copyright © 2015年 zhang_rongwu. All rights reserved.
//

#import "ViewController.h"

#import "UITableView+FDTemplateLayoutCell.h"
#import "FDFTTableViewCell.h"
#import "FDTModel.h"
#define App_Frame_Width  self.view.frame.size.width
#define App_Frame_Height self.view.frame.size.height

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *FDTemplateTableView;
@property (nonatomic, strong) NSMutableArray *modelList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self getData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modelList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString  *reCell = @"FDFTTableViewCell";
    FDFTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reCell];
    cell.model = [self.modelList objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark  UITabelViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat h = [tableView fd_heightForCellWithIdentifier:@"FDFTTableViewCell" configuration:^(FDFTTableViewCell *cell) {
        cell.model = [self.modelList objectAtIndex:indexPath.row];
    }];
    NSLog(@"缓存高度高度：%f", h);
    return h;
}


- (void)getData {
    NSDictionary *param = @{@"token":@"",
                            @"studentId":@"",
                            @"courseDate":@"2015-12-05",
                            @"pageStart":@"0",
                            @"startTime":@"06:00",
                            @"endTime":@"22:00",
                            @"week":@"6",
                            @"pageSize":@"5",
                            @"gymId":@"1785",
                            @"gymCodes":@"1785",
                            @"areaCode":@"010"};
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css", nil]];
    NSString *url = @"http://stage.itis6am.com/apiStudent/getCourseList";
    [manager POST:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([[responseObject objectForKey:@"code"] intValue] == 0) {
            NSArray *list = [[responseObject objectForKey:@"data"] objectForKey:@"courseList"];
            for (NSDictionary *dic in list) {
                FDTModel *model = [[FDTModel alloc] initWithDictionary:dic];
                model.courseImage = @"psb.jpeg";
                [self.modelList addObject:model];
                
            }
        }
        [self.FDTemplateTableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    
    }];

}


-(UITableView *) FDTemplateTableView {
    if (_FDTemplateTableView == nil) {
        _FDTemplateTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, App_Frame_Width, App_Frame_Height) style:UITableViewStyleGrouped];
        _FDTemplateTableView.delegate = self;
        _FDTemplateTableView.dataSource = self;
        [_FDTemplateTableView registerClass:[FDFTTableViewCell class] forCellReuseIdentifier:@"FDFTTableViewCell"];
        [self.view addSubview:_FDTemplateTableView];
        
        _FDTemplateTableView.estimatedRowHeight = 200;
        _FDTemplateTableView.fd_debugLogEnabled = YES;
    }
    return _FDTemplateTableView;
}

- (NSMutableArray *)modelList {
    if (_modelList == nil) {
        _modelList = [[NSMutableArray alloc] init];
    }
    return _modelList;
}
@end
