Sequel.migration do
  up do
    create_table(:snippets) do
      primary_key :id
      String      :title,       null: false, size: 256
      String      :body,        null: false, text: true
      DateTime    :created_at,  null: false
      DateTime    :updated_at,  null: false
    end
  end

  down do
    drop_table :snippets, cascade: true
  end
end
