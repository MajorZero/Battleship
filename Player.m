#import "Player.h"

@implementation Player

-(NSString*)name
{
    return name;
}

-(void)setName:(NSString*)aName
{
    name=aName;
}

-(Player*)initWithName:(NSString*)aName
{
    if(self=[super init])
    {
        [self setName:aName];
        myField=[[Field alloc]init];
        
        [myField createStandardFleet];
        [myField createStandardFleet];
        
        NSLog(@"\n\n== %@ BATTLEFIELD ==", [self name]);
        [myField display];

    }
    
    return self;
}
 
@end
