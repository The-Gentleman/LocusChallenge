require 'rails_helper'

RSpec.describe "Tasks lists controller", type: :system do
    it 'has a new method' do 
        visit task_list_tasks_path
        expect(page).to have_content()
    end 
    
end 
