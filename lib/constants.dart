import 'package:bttvstickers/models/category.dart';
import 'package:flutter/material.dart';

// General constants
const kAppTitle = "BTTV Stickers";
const kDefaultPadding = 10.0;
const kDefaultBorderRadius = 10.0;
const kDefaultSnackBarLifetime = const Duration(milliseconds: 500);

// API constants
const kEmotesApiBaseUrl = "https://api.betterttv.net/3";
const kTopEmotesUrl = "$kEmotesApiBaseUrl/emotes/shared/top";
const kTrendingEmotesUrl = "$kEmotesApiBaseUrl/emotes/shared/trending";
const kSharedEmotesUrl = "$kEmotesApiBaseUrl/emotes/shared";
const kSharedSearchEmotesUrl = "$kSharedEmotesUrl/search";
const kGlobalEmotesUrl = "$kEmotesApiBaseUrl/cached/emotes/global";
const kEmoteCdnUrl = "https://cdn.betterttv.net/emote";

// InfiniteScrollView constants
const kItemLimit = 50;

// HomeScreen constants
const kDefaultCategory = "Category.top";

// Data persistance constants
const kSettingsFileName = "settings";
const kPackFileName = "pack";

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

// PackButton constants
const kPackButtonFadeOutTime = const Duration(milliseconds: 250);

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
