import 'package:bttvstickers/models/category.dart';
import 'package:flutter/material.dart';

// General constants
const kAppTitle = "BTTV Stickers";
const kDefaultPadding = 10.0;
const kDefaultBorderRadius = 10.0;

// API constants
const kTopEmotesUrl = "https://api.betterttv.net/3/emotes/shared/top";
const kTrendingEmotesUrl = "https://api.betterttv.net/3/emotes/shared/trending";
const kSharedEmotesUrl = "https://api.betterttv.net/3/emotes/shared";
const kGlobalEmotesUrl = "https://api.betterttv.net/3/cached/emotes/global";
const kEmoteCdnUrl = "https://cdn.betterttv.net/emote";

// InfiniteScrollView constants
const kItemLimit = 50;

// HomeScreen constants
const kDefaultCategory = "Category.top";

// Data persistance constants
const kSettingsFileName = "settings";

// Settings constants
const kDefaultTheme = ThemeMode.system;

// NavBar constants
const kNavBarHeight = 60.0;
const kSmallNavBarHeight = 40.0;
const kNavBarElevation = 2.0;
const kNavBarIconHeight = 26.0;
const kNavBarIconSplashRadius = kNavBarIconHeight;

// TextField constants
const kTextFieldFontSize = 18.0;

// ErrorCard constants
const kErrorCardBorderSize = 2.0;
const kErrorCardImageWidth = 200.0;
const kErrorCardTextSpacing = 10.0;

// OptionsCard constants
const kIconFieldFlexSpacing = 2;

// EmoteList constants
const kEmoteListSpacing = 8.0;
const kEmoteListVerticalItemCount = 4;

// EmoteTile constants
const kEmoteTileImageHeight = 50.0;
const kEmoteTileImageSubtitleSpacing = 5.0;
