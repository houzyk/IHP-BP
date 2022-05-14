module Web.View.Examples.Show where
import Web.View.Prelude

data ShowView = ShowView { example :: Example }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1>Show Example</h1>
        <p>{example}</p>

    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Examples" ExamplesAction
                            , breadcrumbText "Show Example"
                            ]