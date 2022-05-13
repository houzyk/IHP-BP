module Web.Components.ExampleComponentFolder.ExampleComponent (exampleComponent, Html) where

import IHP.ViewPrelude

-- Component Imports
import Web.Components.ExampleComponentFolder'.ExampleComponent'

exampleComponent :: Html
exampleComponent = [hsx|
	<!-- Component HTML goes here -->
	{exampleComponent'}
|]
