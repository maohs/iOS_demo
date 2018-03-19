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

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate> {
    UITableView *_tableView;
    NSMutableArray *_contacts;//联系人模型
    NSIndexPath *_selectedIndexPath;//当前选中的组和行
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
    _tableView.delegate = self;
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

    //由于此方法调用十分频繁，cell的标示声明成静态变量有利于性能优化
    static NSString *cellIdentifier = @"UITableViewCellIdentifierKey1";
    static NSString *cellIdentifierForFirstRow = @"UITableviewCellIdentifierKeyWithSwitch";
    //首先根据标示去缓存池取
    UITableViewCell *cell;
    if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierForFirstRow];
    }else {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    }
    if (!cell) {
        if (indexPath.row == 0) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifierForFirstRow];
            UISwitch *sw = [[UISwitch alloc] init];
            [sw addTarget:self action:@selector(switchValueChange:) forControlEvents:UIControlEventValueChanged];
            cell.accessoryView = sw;
        }else {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
            cell.accessoryType = UITableViewCellAccessoryDetailButton;
        }
    }
    if (indexPath.row == 0) {
        ((UISwitch *)cell.accessoryView).tag = indexPath.section;
    }
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

#pragma mark 代理方法
#pragma mark 设置分组标题内容高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 50;
    }
    return 40;
}
#pragma mark 设置每行高度（每行高度可以不一样）
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}
#pragma mark 设置尾部说明内容高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 40;
}
#pragma mark 点击行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _selectedIndexPath = indexPath;
    KCContactGroup *group = _contacts[indexPath.section];
    KCContact *contact = group.contacts[indexPath.row];
    //创建弹出窗口
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"System Info" message:[contact getName] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField *textField = [alert textFieldAtIndex:0];
    textField.text = contact.phoneNumber;
    [alert show];//显示窗口
}

#pragma mark 窗口的代理方法，用户保存数据
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    //当点击了第二个按钮(OK)
    if (buttonIndex == 1) {
        UITextField *textField = [alertView textFieldAtIndex:0];
        //修改模型数据
        KCContactGroup *group =_contacts[_selectedIndexPath.section];
        KCContact *contact =group.contacts[_selectedIndexPath.row];
        contact.phoneNumber = textField.text;
        //刷新表格(不推荐使用)
//        [_tableView reloadData];
        //刷新表格
        NSArray *indexPaths = @[_selectedIndexPath];
        [_tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationLeft];
    }
}
#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
#pragma mark 切换开关转化事件
-(void)switchValueChange:(UISwitch *)sw {
    NSLog(@"section:%zi,switch:%zi",sw.tag,sw.on);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
