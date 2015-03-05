# ISRefresh

Easy add UIRefreshControl to any view based UIScrollView

![screenshot](https://raw.githubusercontent.com/isaced/ISRefresh/master/screenshot.gif)

### Usage

```
__weak ViewController *weakSelf = self;
[self.scrollView addHeaderRefreshWithCallback:^{
    // load...
    [weakSelf.scrollView endRefreshing];
}];
```
