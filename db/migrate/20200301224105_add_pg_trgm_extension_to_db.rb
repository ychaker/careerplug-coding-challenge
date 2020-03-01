class AddPgTrgmExtensionToDb < ActiveRecord::Migration[5.1]
  def up
    execute "create extension pg_trgm;"
    execute "create extension unaccent;"
  end

  def down
    execute "drop extension unaccent;"
    execute "drop extension pg_trgm;"
  end
end
