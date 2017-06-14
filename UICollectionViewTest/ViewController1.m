//
//  ViewController1.m
//  UICollectionViewTest
//
//  Created by yebaojia on 17/6/14.
//  Copyright © 2017年 zjs. All rights reserved.
//

#import "ViewController1.h"
#import "CustomCollectionViewCell.h"
#import "JHHeaderFlowLayout.h"

@interface ViewController1 ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong , nonatomic) UICollectionView *collectionV ;
@property (strong , nonatomic) UIView *naviView ;
@property (strong , nonatomic) UILabel *titleLabel;
@property (strong , nonatomic) UIButton *backBtn;
@end

@implementation ViewController1

#pragma mark -- LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;
    [self.view addSubview:self.collectionV];
    [self setNavi];
}

-(void)setNavi{

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.naviView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 64)];

    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 24, 375-120, 33)];
    self.titleLabel.text = @"隐藏导航栏的";
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    
    self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backBtn.frame = CGRectMake(15, 24, 33, 33);
    [self.backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [self.backBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -7, 0, -7)];
    self.backBtn.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    self.backBtn.layer.cornerRadius = 33/2;
    self.backBtn.layer.masksToBounds = YES;
    [self.backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.naviView.backgroundColor = [UIColor clearColor];
    self.titleLabel.textColor = [UIColor clearColor];
    self.backBtn.backgroundColor = [UIColor clearColor];
    
    [self.naviView addSubview:self.backBtn];
    [self.naviView addSubview:self.titleLabel];
    [self.view addSubview:self.naviView];
}

#pragma mark -- Delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat minAlphaOffset = 50;
    CGFloat maxAlphaOffset = 100;
    CGFloat offset = scrollView.contentOffset.y;
    
    CGFloat alpha = (offset - minAlphaOffset) / (maxAlphaOffset - minAlphaOffset);
    self.naviView.backgroundColor = [UIColor colorWithRed:255/255.0 green:59/255.0 blue:48/255.0 alpha:alpha];
    self.titleLabel.textColor = [UIColor colorWithWhite:1 alpha:alpha];
    if (alpha >0) {
        self.backBtn.backgroundColor = [UIColor colorWithWhite:0 alpha:0.45-alpha];
    }else{
        self.backBtn.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    }
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return 41;
    }
}

//分区个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2 ;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return CGSizeMake(0, 0);
    }else{
        return CGSizeMake(375, 46);
    }
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
    if (section == 0) {
        return CGSizeMake(375, 330);
    }else{
        return CGSizeMake(0, 0);
    }
    
}

//设分区头 分区尾
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
            UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
            UILabel *bannerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 375, 330)];
            bannerLabel.text = @"I'm Banner";
            bannerLabel.backgroundColor = [UIColor lightGrayColor];
            bannerLabel.textAlignment = NSTextAlignmentCenter;
            [footer addSubview:bannerLabel];
            return footer;
        }
        return nil;
    }else{
        if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
            UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
            UILabel *bannerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 375, 46)];
            bannerLabel.text = @"I'm Tabbar";
            bannerLabel.backgroundColor = [UIColor whiteColor];
            bannerLabel.textAlignment = NSTextAlignmentCenter;
            [header addSubview:bannerLabel];
            return header;
        }else{
            return nil;
        }
    }
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"pool" forIndexPath:indexPath];
    return cell;
}

#pragma mark -- Events
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -- Setter Getter
-(UICollectionView *)collectionV{
    if (_collectionV == nil) {
        JHHeaderFlowLayout *flowLayout = [[JHHeaderFlowLayout alloc]init];
        flowLayout.itemSize = CGSizeMake(375/2, 375/2);
        flowLayout.minimumLineSpacing = 1 ;
        flowLayout.minimumInteritemSpacing = 1;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        _collectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 375, 667) collectionViewLayout:flowLayout];
        _collectionV.backgroundColor = [UIColor whiteColor];
        _collectionV.dataSource = self;
        _collectionV.delegate = self;
        
        //collection的cell必须经过注册
        [_collectionV registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"pool"];
        
        //collection的分区头 , 分区尾必须经过注册
        [_collectionV registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        [_collectionV registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    }
    return _collectionV;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
