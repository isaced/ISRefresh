# ISRefresh
---

Easy add UIRefreshControl to any view based UIScrollView

![screenshot](https://raw.githubusercontent.com/isaced/ISRefresh/master/screenshot.gif)

### Use

```
[self.collectionView addHeaderRefreshWithCallback:^{
	// load...
	[self.collectionView endRefreshing];
}];

```
