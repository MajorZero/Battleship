#import <Foundation/Foundation.h>
#import "Field.h"

@interface Player : NSObject
{
    NSString *name;
    Field *myField;
}

-(NSString*)name;

-(void)setName:(NSString*)aName;

-(Player*)initWithName:(NSString*)aName;

@end
