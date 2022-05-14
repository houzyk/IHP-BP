module Web.View.Layout (defaultLayout, Html) where

import IHP.ViewPrelude
import IHP.Environment
import qualified Text.Blaze.Html5            as H
import qualified Text.Blaze.Html5.Attributes as A
import Generated.Types
import IHP.Controller.RequestContext
import Web.Types
import Web.Routes
import Application.Helper.View

defaultLayout :: Html -> Html
defaultLayout inner = H.docTypeHtml ! A.lang "en" $ [hsx|
	<head>
		{metaTags}
		{stylesheets}
		{scripts}
		<title>{pageTitleOrDefault "IHP BoilerPlate"}</title>
	</head>
	<body>
		{renderFlashMessages}
		{inner}
	</body>
|]

stylesheets :: Html
stylesheets = [hsx|
	<link rel="stylesheet" href={assetPath "/app.css"}/>
|]

scripts :: Html
scripts = [hsx|
	{when isDevelopment devScripts}
	<script src={assetPath "/vendor/timeago.js"}></script>
	<script src={assetPath "/vendor/morphdom-umd.min.js"}></script>
	<script src={assetPath "/vendor/turbolinks.js"}></script>
	<script src={assetPath "/vendor/turbolinksInstantClick.js"}></script>
	<script src={assetPath "/vendor/turbolinksMorphdom.js"}></script>
	<script src={assetPath "/helpers.js"}></script>
	<script src={assetPath "/ihp-auto-refresh.js"}></script>
	<script src={assetPath "/app.js"}></script>
|]

devScripts :: Html
devScripts = [hsx|
	<script id="livereload-script" src={assetPath "/livereload.js"} data-ws={liveReloadWebsocketUrl}></script>
|]

metaTags :: Html
metaTags = [hsx|
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
	{autoRefreshMeta}
|]
