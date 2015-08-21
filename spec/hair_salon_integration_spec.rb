require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the hair salon webapp', {:type => :feature}) do
    it('properly displays the index page') do
        visit('/')
        expect(page).to have_content('rum')
    end

    it('properly displays stylist manager page') do
        visit('/')
        click_link('Stylist Manager')
        expect(page).to have_content('Stylist Manager')
    end

    it('properly displays client manager page') do
        visit('/')
        click_link('Client Manager')
        expect(page).to have_content('Client Manager')
    end
end
