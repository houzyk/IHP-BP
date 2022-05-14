module Web.Controller.NoModels where
import Web.Controller.Prelude
import Web.View.NoModels.NoModel

instance Controller NoModelsController where
    action NoModelAction = render NoModelView
