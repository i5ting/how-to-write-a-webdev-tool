//
//  No320FileM.h
//  rails-like-dir-example
//
//  Created by sang on 3/14/13.
//  Copyright (c) 2013 no320.com. All rights reserved.
//


#import "DDLog.h"
#import "DDASLLogger.h"
#import "DDTTYLogger.h"
#import "DDFileLogger.h"


//定义日志级别
static const int ddLogLevel = LOG_LEVEL_VERBOSE;

#define CUR_FILE_TO_PROJECT_HOME_BEFORE_LEVEL 4


//#define DDLogError(frmt, ...)   LOG_OBJC_MAYBE(LOG_ASYNC_ERROR,   ddLogLevel, LOG_FLAG_ERROR,   0, frmt, ##__VA_ARGS__)
//#define DDLogWarn(frmt, ...)    LOG_OBJC_MAYBE(LOG_ASYNC_WARN,    ddLogLevel, LOG_FLAG_WARN,    0, frmt, ##__VA_ARGS__)
//#define DDLogInfo(frmt, ...)    LOG_OBJC_MAYBE(LOG_ASYNC_INFO,    ddLogLevel, LOG_FLAG_INFO,    0, frmt, ##__VA_ARGS__)
//#define DDLogVerbose(frmt, ...) LOG_OBJC_MAYBE(LOG_ASYNC_VERBOSE, ddLogLevel, LOG_FLAG_VERBOSE, 0, frmt, ##__VA_ARGS__)

//log.debug("Log4j Debug.");
//log.error("Log4j Error.");
//log.info("Log4j Info.");
//log.fatal("Log4j Fatal.");
#define log_fatal(fmt, ...) DDLogError((@"%s [FATAL] " fmt), __FUNCTION__, ##__VA_ARGS__)
#define log_error(fmt, ...) DDLogError((@"%s [ERROR] " fmt), __FUNCTION__, ##__VA_ARGS__)
#define log_warning(fmt, ...) NSLog((@"%s [WARNING] " fmt), __FUNCTION__, ##__VA_ARGS__)
#define log_info(fmt, ...) DDLogInfo((@"%s [INFO] " fmt), __FUNCTION__, ##__VA_ARGS__)
#define log_debug(fmt, ...) DDLogVerbose((@"%s [VERBOSE] " fmt), __FUNCTION__, ##__VA_ARGS__)


/**
 * 扩展UIResponder
 *
 */
@interface UIResponder(No320LogFileManager)

- (void)setNo320LogConfig;

@end



@interface No320LogFileManager : DDLogFileManagerDefault

@end
