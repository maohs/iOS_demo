//
//  KCContactGroup.h
//  Basic1
//
//  Created by maohs on 2018/3/13.
//  Copyright © 2018年 maohs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KCContactGroup : NSObject

@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *detail;
@property(nonatomic,strong) NSMutableArray *contacts;

-(KCContactGroup *)initWithName:(NSString *)name
                         detail:(NSString *)detail
                       contacts:(NSMutableArray *)contacts;

+(KCContactGroup *)contactGroupWithName:(NSString *)name
                                 detail:(NSString *)detail
                               contacts:(NSMutableArray *)contacts;

@end
