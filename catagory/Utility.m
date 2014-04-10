//
//  Utility.m
//  BodyScale
//
//  Created by Jerry Yu on 13-12-24.
//  Copyright (c) 2013年 于菲. All rights reserved.
//

#import "Utility.h"
#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>

@implementation Utility

/**
 @brief 取APP名称
*/
+(NSString*)getAppname
{
    NSString *appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleExecutableKey];
    return appName;
}
/**
 @brief 取APP版本号
 */
+(NSString*)getAppVersion
{
    //
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
    version =  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return version;
}
/**
 @brief 取Mac地址
 */
+(NSString*)getMacAddress
{
    int                    mib[6];
    size_t                len;
    char                *buf;
    unsigned char        *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl    *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1/n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    // NSString *outstring = [NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    NSString *outstring = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    return [outstring uppercaseString];
}
/**
 @brief iphone的名称
 */
+(NSString*)getModelOwnerName
{
    return [[UIDevice currentDevice] name];//iphone的名称，如Jerry's的iphone
}
/**
 @brief 操作系统名称
 */
+(NSString*)getSystemName
{
    return [[UIDevice currentDevice] systemName];//操作系统名称
}
/**
 @brief 操作系统版本号
 */
+(NSString*)getSystemVersion
{
    return [[UIDevice currentDevice] systemVersion];//操作系统版本号
}
/**
 @brief 硬件设备类型
 */
+(NSString*)getModelType
{
    return [[UIDevice currentDevice] model];//硬件设备类型
}
/**
 @brief 硬件设备类型
 */
+(NSString*)getLocalizedModel
{
    return [[UIDevice currentDevice] localizedModel];//硬件设备类型
}
/**
 @brief 当前语言
 */
+(NSString*)getLanguage
{
    /**
     zh-Hans,
     en,
     fr,
     de,
     ja,
     nl,
     it,
     es,
     pt,
     pt-PT,
     da,
     fi,
     nb,
     sv,
     ko,
     zh-Hant,
     ru,
     pl,
     tr,
     uk,
     ar,
     hr,
     cs,
     el,
     he,
     ro,
     sk,
     th,
     id,
     ms,
     en-GB,
     ca,
     hu,
     vi
     */
    NSString* strLanguage = [[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] objectAtIndex:0];
    return strLanguage;
}
/**
 @brief MD5 16位
 @param str 要加密的字符串
 
+(NSString *)MD516:(NSString *)str
{
    const char *src=[str UTF8String];
    unsigned char result[16];
    
    CC_MD5(src, strlen(src), result);
    
    NSString *ret =[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X", result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7], result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]];
    
    return ret;
}


 @brief MD5 32位
 @param str 要加密的字符串
 
+(NSString *)MD532:(NSString *)str
{
    const char *src = [str UTF8String];
    
    unsigned char result[32];
    
    CC_MD5( src, strlen(src), result );
    
    NSString *ret= [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",result[0],result[1],result[2],result[3],
                    result[4],result[5],result[6],result[7],
                    result[8],result[9],result[10],result[11],
                    result[12],result[13],result[14],result[15],
                    result[16], result[17],result[18], result[19],
                    result[20], result[21],result[22], result[23],
                    result[24], result[25],result[26], result[27],
                    result[28], result[29],result[30], result[31]];
    return  ret;
}
 */
/**
 @brief 拆分字符串到数组
 @param str 要拆分的字符串
 @param splitchar 分隔符
 @return 返回字符串数组
*/
+(NSMutableArray*)splitString:(NSString*)str splitchar:(NSString*)splitchar
{
    NSMutableArray *result=[[NSMutableArray alloc]init];
    
    if ([str isEqualToString:@""]||[splitchar isEqualToString:@""]){
        return result;
    }
    
    NSInteger n=splitchar.length;
    NSString *instr=str;
    NSRange r=[str rangeOfString:splitchar options:NSCaseInsensitiveSearch];
    if (r.location==NSNotFound){
        [result addObject:str];
        return result;
    }
    else{
        while (true) {
            NSString *sub=[instr substringToIndex:r.location];
            [result addObject:sub];
            
            instr=[instr substringFromIndex:r.location+n ];
            r=[instr rangeOfString:splitchar options:NSCaseInsensitiveSearch];
            if (r.location==NSNotFound){
                [result addObject:instr];
                break;
            }
        }
    }
    
    return result;
}
/**
 @brief 创建一个UILabel
 @param rect 位置和大小
 @param text 标题
 @param fontsize 字体大小
 @param textAlignment 文本对齐方式
 @param textcolor 文本颜色
 */
+(UILabel*)createUILabelWithRect:(CGRect)rect text:(NSString*)text fontsize:(float)fontsize textAlignment:(NSTextAlignment)textAlignment textcolor:(UIColor*)textcolor
{
    UILabel *lbl=[[UILabel alloc]initWithFrame:rect];
    [lbl setBackgroundColor:[UIColor clearColor]];
    lbl.opaque=NO;
    [lbl setTextAlignment:textAlignment];
    [lbl setFont:[UIFont systemFontOfSize:fontsize]];
    [lbl setTextColor:textcolor];
    [lbl setText:text];
    
    return lbl;
}

/**
 @brief 生成一个随机数
 @param maxInt 最大值
 */
+(int)getRandomInt:(int)maxInt
{
    int x = arc4random() % maxInt;
    return x;
}

/**
 @brief 截取一段字符
 @param str 字串
 @param nstart 开始索引
 @param len 截取长度
 */
+(NSString*)substring:(NSString*)str nstart:(int)nstart len:(int)len
{
    NSString *result=@"";
    if (str==nil || [str isEqualToString:@""]){
        result=@"";
    }
    if (len>=str.length){
        result=[str substringFromIndex:nstart];
    }
    else{
        result=[str substringFromIndex:nstart];
        result=[result substringToIndex:len];
    }
    return result;
}

/**
 @brief 返回substr在str中的起始索引
 @param str 字串
 @param substr 子串
 */
+(int)indexOfString:(NSString*)str substr:(NSString*)substr
{
    int result=0;
    
    NSRange r=[str rangeOfString:substr];
    if (r.location==NSNotFound){
        result=-1;
    }
    else{
        result=(int)r.location;
    }
    
    return result;
}

/**
 @brief 一个16进制转10进制
 @param s 字符形式的16进制
 */
+(int)hexToDec:(NSString *)s
{
    int int_ch = 0;
    for (int index = 0; index < s.length; index ++) {
        unichar hex_char = [s characterAtIndex:index]; // 取一位
        
        int int_chn = 0;
        int powNum = pow(16, s.length - index - 1);
        if (hex_char >= '0' && hex_char <= '9') {
            int_chn = (hex_char - 48) * powNum ; // 0 的Ascll - 48
        } else if (hex_char >= 'A' && hex_char <= 'F') {
            int_chn = (hex_char - 55) * powNum; // A 的Ascll - 65
        } else {
            int_chn = (hex_char - 87) * powNum; // a 的Ascll - 97
        }
        int_ch += int_chn;
    }
    
    /*
    int int_ch;
    
    unichar hex_char1 = [s characterAtIndex:0]; ////两位16进制数中的第一位(高位*16)
    
    int int_ch1;
    
    if(hex_char1 >= '0'&& hex_char1 <='9'){
        int_ch1 = (hex_char1-48)*16;   //// 0 的Ascll - 48
    }
    else if(hex_char1 >= 'A'&& hex_char1 <='F'){
        int_ch1 = (hex_char1-55)*16; //// A 的Ascll - 65
    }
    else{
        int_ch1 = (hex_char1-87)*16; //// a 的Ascll - 97
    }
    
    unichar hex_char2 = [s characterAtIndex:1]; ///两位16进制数中的第二位(低位)
    
    int int_ch2;
    
    if(hex_char2 >= '0'&& hex_char2 <='9'){
        int_ch2 = (hex_char2-48); //// 0 的Ascll - 48
    }
    else if(hex_char2 >= 'A'&& hex_char2 <='F'){
        int_ch2 = hex_char2-55; //// A 的Ascll - 65
    }
    else{
        int_ch2 = hex_char2-87; //// a 的Ascll - 97
    }
    
    
    int_ch = int_ch1+int_ch2;
     */
    
    return int_ch;
}

@end
