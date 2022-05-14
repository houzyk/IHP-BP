module Web.View.Examples.Edit where
import Web.View.Prelude

data EditView = EditView { example :: Example }

instance View EditView where
    html EditView { .. } = [hsx|
        {breadcrumb}
        <h1>Edit Example</h1>
        {renderForm example}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Examples" ExamplesAction
                , breadcrumbText "Edit Example"
                ]

renderForm :: Example -> Html
renderForm example = formFor example [hsx|
    
    {submitButton}

|]