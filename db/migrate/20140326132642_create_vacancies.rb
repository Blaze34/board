class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string    :name
      t.integer   :salary
      t.string    :employment
      t.datetime  :expire
      t.integer   :user_id
      t.timestamps
    end
  end
end
