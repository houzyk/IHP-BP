module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = HomeAction deriving (Eq, Show, Data)

data ExamplesController
    = ExamplesAction
    | NewExampleAction
    | ShowExampleAction { exampleId :: !(Id Example) }
    | CreateExampleAction
    | EditExampleAction { exampleId :: !(Id Example) }
    | UpdateExampleAction { exampleId :: !(Id Example) }
    | DeleteExampleAction { exampleId :: !(Id Example) }
    deriving (Eq, Show, Data)
