# iOS 两行代码上滑隐藏导航栏，下滑展示导航栏效果，仿简书 淘宝店铺页面效果

效果如下图所示

![demo.gif](https://upload-images.jianshu.io/upload_images/1770896-e0454a699b27cf8f.gif?imageMogr2/auto-orient/strip)


主要代码

```
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint translation = [scrollView.panGestureRecognizer translationInView:scrollView.superview];
    if (translation.y < 0 && scrollView.tracking) {
        [self hideNav];
    }
    
    if (translation.y > 0 && scrollView.tracking) {
        [self showNav];
    }
}
```

有帮助的话麻烦star一下~
