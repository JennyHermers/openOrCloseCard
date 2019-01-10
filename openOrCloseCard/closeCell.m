/*
 **
 * @file: closeCell
 * @brief:关闭的视图cell
 * Copyright: Copyright © 2018
 * Company:岚家小红担
 * @author: 岚家小红担
 * @version: V1.0
 * @date: 2018-10-17
 **/

#import "closeCell.h"

@interface closeCell()
/**背景*/
@property(strong, nonatomic)UIView *whiteBg;
/*测试文字*/
@property(strong, nonatomic)UILabel *lblOpen;
/**按钮 */
@property(strong, nonatomic)UIButton *btnOpen;

@end
@implementation closeCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initLayuot];
    }
    return self;
}


//初始化控件
-(void)initLayuot{
    
    //背景
    _whiteBg = [[UIView alloc]initWithFrame:CGRectMake(14, 0, 345, 115)];
    _whiteBg.backgroundColor = [UIColor greenColor];
    _whiteBg.layer.cornerRadius = 10;
    _whiteBg.clipsToBounds = YES;
    [self addSubview:_whiteBg];
    
    //测试文字
    _lblOpen = [[UILabel alloc] initWithFrame:CGRectMake(20, 19, 200, 16)];
    _lblOpen.font = [UIFont boldSystemFontOfSize:14];
    _lblOpen.textAlignment = NSTextAlignmentLeft;
    [_whiteBg addSubview:_lblOpen];
    
    //按钮
    _btnOpen = [[UIButton alloc]initWithFrame:CGRectMake(301, 3, 34, 34)];
    [_btnOpen setImage:[UIImage imageNamed:@"btn_open"] forState:UIControlStateNormal];
    [_btnOpen addTarget:self action:@selector(openMemberView:) forControlEvents:UIControlEventTouchUpInside];
    [_whiteBg addSubview:_btnOpen];
}


- (void)setView:(openOrCloseModel *)model{
    
    self.lblOpen.text = @"我是关闭的卡片";

    //网络获取数据
//    self.lblOpen.text = [NSString stringWithFormat:@"%@",model.tipStr];
    
}


- (void)openMemberView:(UIButton *)btn{
    
    [self.indexArr addObject:[NSString stringWithFormat:@"%d",self.index]];
    
    if ([self.delegate respondsToSelector:@selector(baseCell:btnType:WithIndex:withArr:)])
    {
        [self.delegate baseCell:self btnType:OPEN WithIndex:self.index withArr:self.indexArr];
    }
}

@end
