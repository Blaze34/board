class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string    :name
      t.integer   :salary
      t.string    :employment
      t.integer   :expire
      t.datetime  :expire_at
      t.integer   :user_id
      t.string    :cached_skill_list
      t.timestamps
    end
  end
end
