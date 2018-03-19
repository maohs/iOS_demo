//
//  KCContact.m
//  Basic1
//
//  Created by maohs on 2018/3/13.
//  Copyright © 2018年 maohs. All rights reserved.
//

#import "KCContact.h"

@implementation KCContact

-(KCContact *)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName phoneNumber:(NSString *)phoneNumber {
    if (self = [super init]) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.phoneNumber = phoneNumber;
    }
    return self;
}

-(NSString *)getName {
    return [NSString stringWithFormat:@"%@ %@",_lastName,_firstName];
}

+(KCContact *)contactWithFirstName:(NSString *)firstName lastName:(NSString *)lastName phoneNumber:(NSString *)phoneNumber {
    KCContact *contact = [[KCContact alloc] initWithFirstName:firstName lastName:lastName phoneNumber:phoneNumber];
    return contact;
}
@end
