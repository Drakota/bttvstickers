import 'package:flutter/material.dart';

// General constants
const kAppTitle = "BTTV Stickers";
const kDefaultPadding = 10.0;
const kDefaultBorderRadius = 10.0;
const kDefaultSnackBarLifetime = Duration(milliseconds: 500);
const kDefaultDebounceTime = Duration(milliseconds: 250);
const kDefaultCardBorderSize = 2.0;

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
const kPackButtonFadeOutTime = Duration(milliseconds: 250);

// ErrorCard constants
const kErrorCardImageWidth = 200.0;
const kErrorCardTextSpacing = 10.0;

// NetworkCard constants
const kNetworkCardImageWidth = 50.0;

// OptionsCard constants
const kIconFieldFlexSpacing = 2;

// EmoteList constants
const kEmoteListSpacing = 8.0;
const kEmoteListVerticalItemCount = 4;
const kEmoteListHorizontalItemCount = 8;

// EmoteTile constants
const kEmoteTileFadeInTime = Duration(milliseconds: 350);
const kEmoteTileImageHeight = 50.0;
const kEmoteTileImageWidth = 50.0;
const kEmoteTileImageSubtitleSpacing = 5.0;

// Strings
const kTutorialWarning =
    "Google deprecated the feature that provided the possibility to add stickers to Gboard. Starting from 2.0.0, BTTV Stickers includes it's own keyboard that provides the same functionality without relying on Google's keyboard";
