class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :plan_time
      t.string :real_time

      t.timestamps null: false
    end
  end
end
