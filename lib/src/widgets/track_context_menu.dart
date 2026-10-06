import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

/// 音频文件长按菜单的动作
enum TrackContextAction {
  addToQueue,
  playNext,
  addToSavedPlaylist,
  download,
  copyName,
}

/// 音频文件长按菜单
///
/// 用法：
/// ```dart
/// final action = await TrackContextMenu.show(context);
/// switch (action) {
///   case TrackContextAction.addToQueue: ...
///   case TrackContextAction.playNext: ...
///   case TrackContextAction.addToSavedPlaylist: ...
///   case TrackContextAction.download: ...
///   case TrackContextAction.copyName: ...
///   case null: // 用户取消
/// }
/// ```
class TrackContextMenu {
  const TrackContextMenu._();

  static Future<TrackContextAction?> show(BuildContext context) {
    return showModalBottomSheet<TrackContextAction>(
      context: context,
      showDragHandle: true,
      builder: (_) => const _TrackContextMenuSheet(),
    );
  }
}

class _TrackContextMenuSheet extends StatelessWidget {
  const _TrackContextMenuSheet();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.queue_music),
            title: Text(s.addToQueue),
            onTap: () =>
                Navigator.of(context).pop(TrackContextAction.addToQueue),
          ),
          ListTile(
            leading: const Icon(Icons.playlist_play),
            title: Text(s.playNext),
            onTap: () =>
                Navigator.of(context).pop(TrackContextAction.playNext),
          ),
          ListTile(
            leading: const Icon(Icons.library_add_outlined),
            title: Text(s.addToSavedPlaylist),
            onTap: () => Navigator.of(context)
                .pop(TrackContextAction.addToSavedPlaylist),
          ),
          ListTile(
            leading: const Icon(Icons.download_outlined),
            title: Text(s.download),
            onTap: () =>
                Navigator.of(context).pop(TrackContextAction.download),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.copy_outlined),
            title: Text(s.copyName),
            onTap: () =>
                Navigator.of(context).pop(TrackContextAction.copyName),
          ),
        ],
      ),
    );
  }
}