//
//  NSDictionary+Nulls.h
//  Conundrums
//
//  Created by lsease on 12/26/15.
//  Copyright © 2015 iParty Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Nulls)
+(NSDictionary*)dictionaryWithoutEmptyValues:(NSDictionary*)input;
@end
