class AddUserFieldsCachedSkills < ActiveRecord::Migration
  def up
    add_column :user_fields,  :cached_skill_list, :string

    UserFields.all.each do |uf|
      uf.save
    end
  end

  def down
    remove_column :user_fields,  :cached_skill_list
  end
end
