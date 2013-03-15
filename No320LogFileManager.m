//
//  No320FileM.m
//  rails-like-dir-example
//
//  Created by sang on 3/14/13.
//  Copyright (c) 2013 no320.com. All rights reserved.
//

#import "No320LogFileManager.h"


@implementation UIResponder(No320LogFileManager)

- (void)setNo320LogConfig
{
    No320LogFileManager *m = [[No320LogFileManager new] autorelease];
    DDFileLogger *fileLogger = [[DDFileLogger alloc] initWithLogFileManager:m];
    
    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    
    [DDLog addLogger:fileLogger];
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
}

@end


@implementation No320LogFileManager

#pragma mark - Override

/**
 * 覆盖父类方法
 *
 * 如果想使用默认日志路径，可以修改此方法名或注释调
 *
 * Returns the path to the default logs directory.
 * If the logs directory doesn't exist, this method automatically creates it.
 *
 */
- (NSString *)defaultLogsDirectory
{
#if TARGET_OS_IPHONE    
    NSString *logsDirectory = @"";
    return [self getLogDirectory];
//    log_info(@"%@",logsDirectory);
//    NSString *logsDirectory = NO320_LOG_DIR;
#else
    //todo other platform
	NSString *appName = [[NSProcessInfo processInfo] processName];
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
	NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : NSTemporaryDirectory();
	NSString *logsDirectory = [[basePath stringByAppendingPathComponent:@"Logs"] stringByAppendingPathComponent:appName];
    
#endif
    
	return logsDirectory;
}



/**
 * 如果想重新命名，可以覆盖此方法
 * 个人觉得没啥必要
 * Generates a new unique log file path, and creates the corresponding log file.
 **/
//- (NSString *)createNewLogFile
//{
//}

#pragma mark - Private Methods Implementions

-(NSString *)getRootDirectoryWithBeforeLevel:(int)blevel
{
    NSString *current_dir = [NSString stringWithFormat:@"%s",__FILE__];
    log_info(@"current_dir = %@",current_dir);
    return [self getDirectory:current_dir withBeforeLevel:blevel];
}

-(NSString *)getLogDirectory
{
    log_info(@"log dir = %@",[self getRootDirectoryWithBeforeLevel:CUR_FILE_TO_PROJECT_HOME_BEFORE_LEVEL]);
    NSString *log_dir = [NSString stringWithFormat:@"%@/%@",[self getRootDirectoryWithBeforeLevel:CUR_FILE_TO_PROJECT_HOME_BEFORE_LEVEL],@"src/log/"];
    log_info(@"log_dir = %@",log_dir);
    return log_dir;
}

-(NSString *)getDirectory:(NSString *)current_dir withBeforeLevel:(int)blevel
{
    //NSString *current_dir = [NSString stringWithFormat:@"%s",__FILE__];
    NSMutableArray *dir_arr = [NSMutableArray arrayWithArray:[current_dir componentsSeparatedByString:@"/"]];
    
    for (int i = 0; i< blevel; i++) {
        [dir_arr removeObjectAtIndex:[dir_arr count]-1];
    }
    
    return [dir_arr componentsJoinedByString:@"/"];
}

@end
