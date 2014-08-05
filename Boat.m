#import "Boat.h"

@implementation Boat

-(NSString*)bodyId
{
    return bodyId;
}

-(void)setBodyId:(NSString*)anId
{
    bodyId=anId;
}

//getter
-(NSString*) bodyAtN:(NSUInteger)n
{
    return [body objectAtIndex:n];
}

//setter
-(void) setBodyAtN:(NSUInteger)n
               Val:(NSString*)v
{
    [body insertObject:v atIndex:n];
}

-(NSUInteger)coordX
{
    return coordX;
}

-(void)setCoordX:(NSUInteger)aCoord
{
    coordX=aCoord;
}

-(NSUInteger)coordY
{
    return coordY;
}

-(void)setCoordY:(NSUInteger)aCoord
{
    coordY=aCoord;
}

-(NSString*)direction
{
    return direction;
}

-(void)setDirection:(NSString*)aDirection
{
    direction=aDirection;
}

-(NSUInteger) bodySize
{
    return [body count];
}

-(Boat*)initWithSize:(NSUInteger)size
                  ID:(NSString*)anId
              coordX:(NSUInteger)X
              coordY:(NSUInteger)Y
           direction:(NSString*)aDir
{
    if(self=[super init])
    {
        body=[NSMutableArray arrayWithCapacity:size];
        [self setBodyId:anId];
        [self setCoordX:X];
        [self setCoordY:Y];
        
    
        int overX=(int)(X+size);
        int overY=(int)(Y+size);
        
        if([aDir isEqualToString:@"o"] && (overY > 10))
        {
            [self setDirection:@"OverY"];
        }
        else if([aDir isEqualToString:@"v"] && (overX > 10))
        {
            [self setDirection:@"OverX"];
        }
        else
        {
            [self setDirection:aDir];
        }
        for(NSUInteger i=0; i<size; i++)
        {
            [self setBodyAtN:i Val:anId];
        }
    }
    return self;
    
}

-(void) displayBoat
{
    for(NSUInteger i=0; i<[self bodySize]; i++)
    {
        const char *c=[[self bodyAtN:i] UTF8String];
        printf("[%s]", c);
    }
    printf("\n");
}

-(void)shot:(NSUInteger)n
{
    [body replaceObjectAtIndex:n withObject:@"9"];
}

-(void)isHitted
{
    isHitted=NO;
    
    for(NSUInteger i=0; i<[self bodySize];)
    {
        if([[self bodyAtN:i]isEqual:@"9"])
        {
            isHitted=YES;
            i++;
        }
        else
        {
            isHitted=NO;
            i=[self bodySize];
        }
    }

    if(isHitted)
    {
        NSLog(@"Boat n. %@ is DEAD!", [self bodyId]);
    }
    else
    {
        NSLog(@"Boat n. %@ is ALIVE!", [self bodyId]);
    }

}


@end
