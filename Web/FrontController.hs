module Web.FrontController where

import IHP.RouterPrelude
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout)

-- Controller Imports
import Web.Controller.Examples
import Web.Controller.NoModels
import Web.Controller.Static

instance FrontController WebApplication where
    controllers =
        [ startPage HomeAction
        , parseRoute @ExamplesController
        , parseRoute @NoModelsController
        ]

instance InitControllerContext WebApplication where
    initContext = do
        setLayout defaultLayout
        initAutoRefresh
