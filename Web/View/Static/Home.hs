module Web.View.Static.Home where
import Web.View.Prelude

-- Components Imports
import Web.View.Components.ExampleComponent

data HomeView = HomeView

instance View HomeView where
	html HomeView = [hsx|
		<!-- HTML goes here -->
		{exampleComponent}
|]
