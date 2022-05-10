module Web.View.Static.Home where
import Web.View.Prelude

data HomeView = HomeView

instance View HomeView where
	html HomeView = [hsx|
		<!-- HTML goes here -->
|]
