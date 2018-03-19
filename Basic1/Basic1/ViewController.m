//
//  ViewController.m
//  Basic1
//
//  Created by maohs on 2018/3/13.
//  Copyright © 2018年 maohs. All rights reserved.
//

#import "ViewController.h"
#import "KCContact.h"
#import "KCContactGroup.h"

@interface ViewController ()<UITableViewDataSource> {
    UITableView *_tableView;
    NSMutableArray *_contacts;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //初始化数据
    [self initData];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

-(void)initData {
    _contacts = [[NSMutableArray alloc] init];
    KCContact *contact1 = [[KCContact alloc] initWithFirstName:@"Cui" lastName:@"Kenshin" phoneNumber:@"18500131234"];
    KCContact *contact2 = [[KCContact alloc] initWithFirstName:@"Cui" lastName:@"Kenshin" phoneNumber:@"18500131237"];
    KCContactGroup *group1 = [[KCContactGroup alloc] initWithName:@"C" detail:@"With names beginning with C" contacts:[NSMutableArray arrayWithObjects:contact1,contact2, nil]];
    [_contacts addObject:group1];

    KCContact *contact3=[[KCContact alloc] initWithFirstName:@"Lee" lastName:@"Terry" phoneNumber:@"18500131238"];
    KCContact *contact4=[[KCContact alloc] initWithFirstName:@"Lee" lastName:@"Jack" phoneNumber:@"18500131239"];
    KCContact *contact5=[[KCContact alloc] initWithFirstName:@"Lee" lastName:@"Rose" phoneNumber:@"18500131240"];
    KCContactGroup *group2=[[KCContactGroup alloc] initWithName:@"L" detail:@"With names beginning with L" contacts:[NSMutableArray arrayWithObjects:contact3,contact4,contact5, nil]];
    [_contacts addObject:group2];



    KCContact *contact6=[[KCContact alloc] initWithFirstName:@"Sun" lastName:@"Kaoru" phoneNumber:@"18500131235"];
    KCContact *contact7=[[KCContact alloc] initWithFirstName:@"Sun" lastName:@"Rosa" phoneNumber:@"18500131236"];

    KCContactGroup *group3=[[KCContactGroup alloc] initWithName:@"S" detail:@"With names beginning with S" contacts:[NSMutableArray arrayWithObjects:contact6,contact7, nil]];
    [_contacts addObject:group3];


    KCContact *contact8=[[KCContact alloc] initWithFirstName:@"Wang" lastName:@"Stephone" phoneNumber:@"18500131241"];
    KCContact *contact9=[[KCContact alloc] initWithFirstName:@"Wang" lastName:@"Lucy" phoneNumber:@"18500131242"];
    KCContact *contact10=[[KCContact alloc] initWithFirstName:@"Wang" lastName:@"Lily" phoneNumber:@"18500131243"];
    KCContact *contact11=[[KCContact alloc] initWithFirstName:@"Wang" lastName:@"Emily" phoneNumber:@"18500131244"];
    KCContact *contact12=[[KCContact alloc] initWithFirstName:@"Wang" lastName:@"Andy" phoneNumber:@"18500131245"];
    KCContactGroup *group4=[[KCContactGroup alloc] initWithName:@"W" detail:@"With names beginning with W" contacts:[NSMutableArray arrayWithObjects:contact8,contact9,contact10,contact11,contact12, nil]];
    [_contacts addObject:group4];


    KCContact *contact13=[[KCContact alloc] initWithFirstName:@"Zhang" lastName:@"Joy" phoneNumber:@"18500131246"];
    KCContact *contact14=[[KCContact alloc] initWithFirstName:@"Zhang" lastName:@"Vivan" phoneNumber:@"18500131247"];
    KCContact *contact15=[[KCContact alloc] initWithFirstName:@"Zhang" lastName:@"Joyse" phoneNumber:@"18500131248"];
    KCContactGroup *group5=[[KCContactGroup alloc] initWithName:@"Z" detail:@"With names beginning with Z" contacts:[NSMutableArray arrayWithObjects:contact13,contact14,contact15, nil]];
    [_contacts addObject:group5];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    KCContactGroup *group=_contacts[section];
    return group.contacts.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _contacts.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSIndexPath是一个结构体，记录了组和行信息
    NSLog(@"生成单元格(组：%zi,行%zi)",indexPath.section,indexPath.row);
    KCContactGroup *group=_contacts[indexPath.section];
    KCContact *contact=group.contacts[indexPath.row];
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text=[contact getName];
    cell.detailTextLabel.text=contact.phoneNumber;
    return cell;
}

#pragma mark 返回每组头标题名称
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSLog(@"生成组（组%zi）名称",section);
    KCContactGroup *group=_contacts[section];
    return group.name;
}

#pragma mark 返回每组尾部说明
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NSLog(@"生成尾部（组%zi）详情",section);
    KCContactGroup *group=_contacts[section];
    return group.detail;
}

#pragma mark 返回每组标题索引
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray *indexs = [[NSMutableArray alloc] init];
    for (KCContactGroup *group in _contacts) {
        [indexs addObject:group.name];
    }
    return indexs;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
