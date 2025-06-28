import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.article});

  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: () {
        _showArticleDetailsBottomSheet(context, article);
      },
      child: Container(
        padding: REdgeInsets.all(8),
        margin: REdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: ColorsManager.white, width: 1.w),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? '',
                progressIndicatorBuilder:
                    (context, url, downloadProgress) =>
                        CircularProgressIndicator(
                          value: downloadProgress.progress,
                        ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              article.title ?? "",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    article.author ?? "",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                Expanded(
                  child: Text(
                    article.publishedAt ?? "",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showArticleDetailsBottomSheet(BuildContext context, ArticleEntity article) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          padding: REdgeInsets.all(16),
          margin: REdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: ColorsManager.black17
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage ?? '',
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                              value: downloadProgress.progress,
                            ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  article.title ?? "",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(height: 10.h),
                ElevatedButton(
                  onPressed: () {
                    _launchUrl(article.url ?? "");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.white,
                    foregroundColor: ColorsManager.black17,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r)
                    )
                  ),
                  child: Text("View full article", textAlign: TextAlign.center,),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _launchUrl(String url) async {
    Uri uri = Uri.parse(url);
    if(await canLaunchUrl(uri)){
      await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
    }
  }
}
