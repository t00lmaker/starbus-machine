defmodule HikerWeb.ChangesetView do
  use HikerWeb, :view

  @doc """
  Traverses and translates changeset errors.

  See `Ecto.Changeset.traverse_errors/2` and
  `HikerWeb.ErrorHelpers.translate_error/1` for more details.
  """
  def render("error.json", %Ecto.Changeset{} = changeset) do
    errors =
      changeset
      # ecto extract and translate the errors
      |> translate_errors()
      # give to function extract the details and format
      |> traverse_detail()
      |> List.flatten()

    %{errors: errors}
  end

  def translate_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, &translate_error/1)
  end

  defp traverse_detail(details) do
    Enum.map(details, fn {field, detail} ->
      cond do
        is_list(detail) ->
          serializer_detail({field, detail})

        is_map(detail) ->
          traverse_detail(detail)

        true ->
          %{}
      end
    end)
  end

  defp serializer_detail({field, detail}) do
    Enum.map(detail, fn title ->
      %{
        source: %{pointer: "/data/attributes/#{field}"},
        title: title,
        detail: "#{field} #{title}"
      }
    end)
  end
end
