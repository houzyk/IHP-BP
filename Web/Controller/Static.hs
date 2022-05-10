module Web.Controller.Static where
import Web.Controller.Prelude
import Web.View.Static.Home

instance Controller StaticController where
    action HomeAction = render HomeView
