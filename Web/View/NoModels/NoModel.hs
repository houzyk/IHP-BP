module Web.View.NoModels.NoModel where
import Web.View.Prelude

data NoModelView = NoModelView

instance View NoModelView where
	html NoModelView = [hsx|
		<!-- No Model HTML goes here -->
|]
