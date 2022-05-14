module Web.View.Examples.Index where
import Web.View.Prelude

data IndexView = IndexView { examples :: [Example]  }

instance View IndexView where
    html IndexView { .. } = [hsx|
        {breadcrumb}

        <h1>Index<a href={pathTo NewExampleAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Example</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach examples renderExample}</tbody>
            </table>
            
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Examples" ExamplesAction
                ]

renderExample :: Example -> Html
renderExample example = [hsx|
    <tr>
        <td>{example}</td>
        <td><a href={ShowExampleAction (get #id example)}>Show</a></td>
        <td><a href={EditExampleAction (get #id example)} class="text-muted">Edit</a></td>
        <td><a href={DeleteExampleAction (get #id example)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]