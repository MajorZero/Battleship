#import <Foundation/Foundation.h>

@interface Boat : NSObject
{
    NSMutableArray *body;
    NSString *bodyId;
    NSUInteger coordX;
    NSUInteger coordY;
    NSString *direction;
    BOOL isHitted;
}

-(NSString*)bodyId;

-(void)setBodyId:(NSString*)anId;

//getter
-(NSString*) bodyAtN:(NSUInteger)n;

//setter
-(void) setBodyAtN:(NSUInteger)n
               Val:(NSString*)v;

-(NSUInteger)coordX;

-(void)setCoordX:(NSUInteger)aCoord;

-(NSUInteger)coordY;

-(void)setCoordY:(NSUInteger)aCoord;

-(NSString*)direction;

-(void)setDirection:(NSString*)aDirection;

-(NSUInteger) bodySize;

-(Boat*)initWithSize:(NSUInteger)size
                  ID:(NSString*)anId
              coordX:(NSUInteger)X
              coordY:(NSUInteger)Y
           direction:(NSString*)aDir;

-(void) displayBoat;

-(void) shot:(NSUInteger)n;

-(void)isHitted;

@end
