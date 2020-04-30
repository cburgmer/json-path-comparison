#import <Foundation/Foundation.h>
#import <SMJJSONPath/SMJJSONPath.h>

#define NSLog(FORMAT, ...) fprintf(stderr, "%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

@interface PoormansRFC7159ConformingJSONSerialization : NSObject

+ (id)JSONObjectWithData:(NSData *)data
                   error:(NSError * _Nullable *)error;

+ (NSData *)dataWithJSONObject:(id)obj
                         error:(NSError * _Nullable *)error;

@end


@implementation PoormansRFC7159ConformingJSONSerialization

+ (id)JSONObjectWithData:(NSData *)data
                   error:(NSError * _Nullable *)error {
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];

    NSString *augmentedJson = [NSString stringWithFormat:@"[%@]", jsonString];
    NSData *augmentedData = [augmentedJson dataUsingEncoding:NSUTF8StringEncoding];

    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:augmentedData options:0 error:error];
    return jsonArray[0];
}

+ (NSData *)dataWithJSONObject:(id)obj
                         error:(NSError * _Nullable *)error {
    NSArray *array = [NSArray arrayWithObjects: obj, nil];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:0 error:error];

    NSRange range = {1, [jsonData length] - 2};
    return [jsonData subdataWithRange:range];
}

@end


int main (int argc, const char * argv[]) {
    NSString *selector = [NSString stringWithUTF8String:argv[1]];

    NSError *error = nil;

    NSFileHandle *kbd = [NSFileHandle fileHandleWithStandardInput];
    NSData *data = [kbd availableData];

    id jsonObject = [PoormansRFC7159ConformingJSONSerialization JSONObjectWithData:data error:&error];
    if (error) {
        NSLog(@"%@", error.localizedDescription);
        return 1;
    }

    SMJJSONPath *jsonPath = [[SMJJSONPath alloc] initWithJSONPathString:selector error:&error];
    SMJConfiguration *configuration = [SMJConfiguration defaultConfiguration];
    if (error) {
        NSLog(@"%@", error.localizedDescription);
        return 1;
    }

    id result;
    @try  {
        result = [jsonPath resultForJSONObject:jsonObject configuration:configuration error:&error];
        if (error) {
            NSLog(@"%@", error.localizedDescription);
            return 1;
        }
    } @catch (NSException *exception) {
        NSLog(@"%@ %@ ", exception.name, exception.reason);
        return 1;
    }

    NSData *jsonData = [PoormansRFC7159ConformingJSONSerialization dataWithJSONObject:result error:&error];
    if (error) {
        NSLog(@"%@", error.localizedDescription);
        return 1;
    }
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];

    printf("%s\n", [jsonString UTF8String]);
}
