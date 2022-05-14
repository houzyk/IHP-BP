module Web.View.Examples.New where
import Web.View.Prelude

data NewView = NewView { example :: Example }

instance View NewView where
    html NewView { .. } = [hsx|
        {breadcrumb}
        <h1>New Example</h1>
        {renderForm example}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Examples" ExamplesAction
                , breadcrumbText "New Example"
                ]

renderForm :: Example -> Html
renderForm example = formFor example [hsx|
    
    {submitButton}

|]