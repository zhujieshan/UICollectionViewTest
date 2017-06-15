//
//  DBHomeViewController.m
//  DuoBao
//
//  Created by zjs on 15/12/11.
//  Copyright © 2015年 maja. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong , nonatomic) UICollectionView *collectionV ;
@end

@implementation ViewController

#pragma mark -- LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"带导航栏";
    [self.view addSubview:self.collectionV];
}

#pragma mark -- Delegate
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

#pragma mark -- Setter Getter
-(UICollectionView *)collectionV{
    if (_collectionV == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];\
        flowLayout.sectionHeadersPinToVisibleBounds = YES;
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
        
        //
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
