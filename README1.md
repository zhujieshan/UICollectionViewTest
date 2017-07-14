# UICollectionViewTest
创建一个带banner带悬浮头部的collectionView

UICollectionView 和 UITableView 的用法十分相似 但是UICollectionView的功能较强大一点 用法复杂点
其中我们经常使用的UITableView的悬浮header,但是UICollectionView实现起来麻烦一点

需求:
1.最顶部显示banner
2.banner下面是选项bar 下拉悬浮选项bar

解决方法 :
因为设置了头部悬浮 所以创建了2个分区section 第一个section的footerview显示banner 第二个section的headview显示选项bar

其中用到了JHHeaderFlowLayout GitHub链接:https://github.com/JHCoderLion/UICollectionViewHeaderFloat