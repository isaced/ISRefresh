# ISRefresh
---

Easy add UIRefreshControl to any view based UIScrollView

### Use


```
[self.collectionView addHeaderRefreshWithCallback:^{
	// load...
	[self.collectionView endRefreshing];
}];

```