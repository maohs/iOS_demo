//
//  KCContactGroup.m
//  Basic1
//
//  Created by maohs on 2018/3/13.
//  Copyright © 2018年 maohs. All rights reserved.
//

#import "KCContactGroup.h"

@implementation KCContactGroup

-(KCContactGroup *)initWithName:(NSString *)name detail:(NSString *)detail contacts:(NSMutableArray *)contacts {
    if (self = [super init]) {
        self.name = name;
        self.detail = detail;
        self.contacts = contacts;
    }
    return self;
}

+(KCContactGroup *)contactGroupWithName:(NSString *)name detail:(NSString *)detail contacts:(NSMutableArray *)contacts {
    KCContactGroup *contactGroup = [[KCContactGroup alloc] initWithName:name detail:detail contacts:contacts];
    return contactGroup;
}
@end
