require 'rails_helper'
RSpec.describe ApplicationHelper, type: :helper do
  describe 'Active link' do
    it 'Link should contain class name active' do
      link = active_link_to('test', '/test', 'link')
      expect(link).to eq('<a class="link " href="/test">test</a>')
    end
  end
end
