require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the hair salon webapp', {:type => :feature}) do
    it('properly displays the index page') do
        visit('/')
        expect(page).to have_content('Stylist Manager')
    end

    it('properly displays stylist manager page') do
        visit('/')
        click_link('Stylist Manager')
        expect(page).to have_content('Stylists')
    end

    it('properly displays client manager page') do
        visit('/')
        click_link('Client Manager')
        expect(page).to have_content('Clients')
    end

    it('properly adds and displays a new stylist') do
        visit('/stylists')
        fill_in('name', :with => 'Mike')
        fill_in('specialty', :with => 'Dyeing')
        click_button('Add Stylist')
        expect(page).to have_content('Mike')
    end

    it('properly adds and displays a new client') do
        visit('/clients')
        fill_in('name', :with => 'Mike')
        fill_in('hairtype', :with => 'Dyeing')
        click_button('Add Client')
        expect(page).to have_content('Mike')
    end
end
