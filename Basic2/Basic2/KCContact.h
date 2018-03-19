//
//  KCContact.h
//  Basic1
//
//  Created by maohs on 2018/3/13.
//  Copyright © 2018年 maohs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KCContact : NSObject

@property(nonatomic,copy) NSString *firstName;
@property(nonatomic,copy) NSString *lastName;
@property(nonatomic,copy) NSString *phoneNumber;

-(KCContact *)initWithFirstName:(NSString *)firstName
                       lastName:(NSString *)lastName
                    phoneNumber:(NSString *)phoneNumber;

-(NSString *)getName;

+(KCContact *)contactWithFirstName:(NSString *)firstName
                          lastName:(NSString *)lastName
                       phoneNumber:(NSString *)phoneNumber;
@end
