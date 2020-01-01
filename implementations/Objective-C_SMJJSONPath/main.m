#import <Foundation/Foundation.h>
#import <SMJJSONPath/SMJJSONPath.h>

#define NSLog(FORMAT, ...) fprintf(stderr, "%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

int main (int argc, const char * argv[]) {
    NSString *selector = [NSString stringWithFormat:@"%s", argv[1]];

    NSError *error = nil;

    NSFileHandle *kbd = [NSFileHandle fileHandleWithStandardInput];
    NSData *data = [kbd availableData];

    id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
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

    // poorman's JSON serialization
    if ([result isKindOfClass:[NSString class]]) {
        printf("\"%s\"\n", [result UTF8String]);
    } else if ([result isKindOfClass:[NSNumber class]]) {
        printf("%d\n", [result intValue]);
    } else {
        // NSLog(@"Is of type: %@", [result class]);

        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:result options:0 error:&error];
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];

        printf("%s\n", [jsonString UTF8String]);
    }
}
